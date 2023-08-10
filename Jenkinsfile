@Library('tfc-lib') _

flags = gitParseFlags()

dockerConfig = getDockerConfig(['MATLAB','Vivado'], matlabHSPro=false)
dockerConfig.add("-e MLRELEASE=R2022b")
dockerHost = 'docker'

////////////////////////////

hdlBranches = ['master','hdl_2021_r2']

stage("Build Toolbox") {
    dockerParallelBuild(hdlBranches, dockerHost, dockerConfig) { 
	branchName ->
	try {
		withEnv(['HDLBRANCH='+branchName,'LC_ALL=C.UTF-8','LANG=C.UTF-8']) {
		    checkout scm
		    sh 'git submodule update --init' 
		    sh 'make -C ./CI/scripts build'
		    sh 'pip3 install -r requirements_doc.txt'
		    sh 'make -C ./CI/gen_doc doc_ml'
		    sh 'make -C ./CI/scripts add_libad9361'
		    sh 'make -C ./CI/scripts gen_tlbx'
		}
        } catch(Exception ex) {
		if (branchName == 'hdl_2021_r2') {
		    error('Production Toolbox Build Failed')
		}
		else {
		    unstable('Development Build Failed')
		}
        }
        if (branchName == 'hdl_2021_r2') {
            stash includes: '**', name: 'builtSources', useDefaultExcludes: false
            archiveArtifacts artifacts: 'hdl/*', followSymlinks: false, allowEmptyArchive: true
        }
    }
}

/////////////////////////////////////////////////////

boardNames = [
    'fmcomms2_zed',
    'fmcomms2_zc702','fmcomms5_zc702',
    'fmcomms2_zc706','fmcomms5_zc706','adrv9371x_zc706','adrv9009_zc706',
    'fmcomms2_zcu102','adrv9002_zcu102','adrv9009_zcu102','adrv9371x_zcu10','fmcomms8_zcu102',
    'adrv9361z7035_ccbob_cmos','adrv9361z7035_ccbob_lvds','adrv9361z7035_ccfmc_lvds','adrv9361z7035_ccpackrf_lvds',
    'adrv9364z7020_ccbob_cmos','adrv9364z7020_ccbob_lvds',
    'pluto']
dockerConfig.add("-e HDLBRANCH=hdl_2021_r2")

cstage("HDL Tests", "", flags) {
    dockerParallelBuild(boardNames, dockerHost, dockerConfig) { 
        branchName ->
        withEnv(['BOARD='+branchName]) {
            cstage("Source", branchName, flags) {
                unstash "builtSources"
                sh 'make -C ./CI/scripts test'
                junit testResults: 'test/*.xml', allowEmptyResults: true
                archiveArtifacts artifacts: 'test/logs/*', followSymlinks: false, allowEmptyArchive: true
            }
/*
            stage("Synth") {
                unstash "builtSources"
                sh 'make -C ./CI/scripts test_synth'
                junit testResults: 'test/*.xml', allowEmptyResults: true
                archiveArtifacts artifacts: 'test/logs/*', followSymlinks: false, allowEmptyArchive: true
            }
*/
            cstage("Installer", branchName, flags) {
                unstash "builtSources"
                sh 'make -C ./CI/scripts test_installer'
                junit testResults: 'test/*.xml', allowEmptyResults: true
                archiveArtifacts artifacts: 'test/logs/*', followSymlinks: false, allowEmptyArchive: true
            }
        }
    }
}

/////////////////////////////////////////////////////

demoNames = ['HDLFrequencyHopper','HDLTuneAGC','KernelFrequencyHopper']

def deployments = [:]
for (int i=0; i < demoNames.size(); i++) {
    def demo = demoNames[i];
    def nodeLabel = 'baremetal';
    if (demo.contains("zcu102"))
        nodeLabel = 'baremetal && high_memory';
    deployments[demo] = { node(nodeLabel) {
        stage("Demo Tests") {
            withEnv(['DEMO='+demo,'MLRELEASE=R2022b','HDLBRANCH=hdl_2021_r2','LC_ALL=C.UTF-8','LANG=C.UTF-8']) {
                try {
                    stage(demo) {
                        echo "Node: ${env.NODE_NAME}"
                        echo "Demo: ${env.DEMO}"
                        unstash "builtSources"
                        sh 'make -C ./CI/scripts test_targeting_demos'
                        junit testResults: 'test/*.xml', allowEmptyResults: true
                        archiveArtifacts artifacts: 'test/*', followSymlinks: false, allowEmptyArchive: true
                    }
                }
                finally {
                    cleanWs();
                }
            }
        }
    }}
}

parallel deployments

/////////////////////////////////////////////////////

appNames = ['lte_pa_app']

cstage("Build Deployable Apps", "", flags) {
    dockerParallelBuild(appNames, dockerHost, dockerConfig) { 
        branchName ->
        withEnv(['APP='+branchName]) {
            cstage("Build DApps", branchName, flags) {
                unstash "builtSources"
                sh 'make -C ./CI/scripts ${APP}'
                archiveArtifacts artifacts: 'trx_examples/streaming/LTE_PA_App/LTEPAinstaller/*.exe', followSymlinks: false, allowEmptyArchive: true
                archiveArtifacts artifacts: 'trx_examples/streaming/LTE_PA_App/LTEPAinstaller/*.install', followSymlinks: false, allowEmptyArchive: true
            }
        }
    }
}

/////////////////////////////////////////////////////

classNames = ["zynq-zed-adv7511-adrv9002-vcmos",
        "zynqmp-zcu102-rev10-adrv9002-vcmos",
        "pluto",
        "zynq-adrv9361-z7035-fmc",
        "zynq-zed-adv7511-ad9364-fmcomms4",
        "zynq-zed-adv7511-ad9361-fmcomms2-3",
        "zynq-zc706-adv7511-ad9361-fmcomms5",
        "zynq-zc702-adv7511-ad9361-fmcomms2-3",
        "zynq-adrv9364-z7020-bob-vcmos"]

cstage("Hardware Streaming Tests", "", flags) {
    dockerParallelBuild(classNames, dockerHost, dockerConfig) { 
        branchName ->
        withEnv(['BOARD='+branchName]) {
            unstash "builtSources"
            sh 'echo ${BOARD}'
            sh 'wget https://raw.githubusercontent.com/analogdevicesinc/pyadi-iio/master/.github/scripts/install_iioemu.sh'
            sh 'chmod +x install_iioemu.sh'
            sh './install_iioemu.sh'
            sh 'git clone https://github.com/MartinKoch123/yaml'
            sh 'make -C ./CI/scripts test_emualted'
        }
    }
}

//////////////////////////////////////////////////////

node {
    cstage('Deploy Development', "", flags) {
        unstash "builtSources"
        uploadArtifactory('TransceiverToolbox','*.mltbx')
    }
    if (env.BRANCH_NAME == 'master') {
        cstage('Deploy Production', "", flags) {
            unstash "builtSources"
            uploadFTP('TransceiverToolbox','*.mltbx')
        }
    }
}

