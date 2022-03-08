@Library('tfc-lib') _

dockerConfig = getDockerConfig(['MATLAB','Vivado'], matlabHSPro=false)
dockerConfig.add("-e MLRELEASE=R2021b")
dockerHost = 'docker'

////////////////////////////

hdlBranches = ['hdl_2019_r2']

stage("Build Toolbox") {
    dockerParallelBuild(hdlBranches, dockerHost, dockerConfig) { 
	branchName ->
	try {
		withEnv(['HDLBRANCH='+branchName]) {
		    checkout scm
		    sh 'git submodule update --init'
		    sh 'make -C ./CI/scripts build'
		    sh 'make -C ./CI/scripts doc'
		    sh 'make -C ./CI/scripts add_libad9361'
		    sh 'make -C ./CI/scripts gen_tlbx'
		}
        } catch(Exception ex) {
		if (branchName == 'hdl_2019_r2') {
		    error('Production Toolbox Build Failed')
		}
		else {
		    unstable('Development Build Failed')
		}
        }
        if (branchName == 'hdl_2019_r2') {
            stash includes: '**', name: 'builtSources', useDefaultExcludes: false
            archiveArtifacts artifacts: 'hdl/*', followSymlinks: false, allowEmptyArchive: true
            archiveArtifacts artifacts: '*.mltbx', followSymlinks: false, allowEmptyArchive: true
        }
    }
}

/////////////////////////////////////////////////////
/*
boardNames = ['zed','zc702','zc706','zcu102','adrv9361','adrv9364','pluto']
dockerConfig.add("-e HDLBRANCH=hdl_2019_r2")

stage("HDL Tests") {
    dockerParallelBuild(boardNames, dockerHost, dockerConfig) { 
        branchName ->
        withEnv(['BOARD='+branchName]) {
            stage("Source") {
                unstash "builtSources"
                sh 'make -C ./CI/scripts test'
                junit testResults: 'test/*.xml', allowEmptyResults: true
                archiveArtifacts artifacts: 'test/logs/*', followSymlinks: false, allowEmptyArchive: true
            }
            stage("Synth") {
                unstash "builtSources"
                sh 'make -C ./CI/scripts test_synth'
                junit testResults: 'test/*.xml', allowEmptyResults: true
                archiveArtifacts artifacts: 'test/logs/*', followSymlinks: false, allowEmptyArchive: true
            }
            stage("Installer") {
                unstash "builtSources"
                sh 'make -C ./CI/scripts test_installer'
                junit testResults: 'test/*.xml', allowEmptyResults: true
                archiveArtifacts artifacts: 'test/logs/*', followSymlinks: false, allowEmptyArchive: true
            }
        }
    }
}
*/
demoNames = ['HDLLoopbackDelayEstimation','HDLFrequencyHopper','HDLTuneAGC','KernelFrequencyHopper']

stage("Demo Tests") {
    dockerParallelBuild(demoNames, dockerHost, dockerConfig) {
        branchName ->
        withEnv(['DEMO='+branchName]) {
            unstash "builtSources"
            sh 'make -C ./CI/scripts test_targeting_demos'
            junit testResults: 'test/*.xml', allowEmptyResults: true
            archiveArtifacts artifacts: 'test/logs/*', followSymlinks: false, allowEmptyArchive: true
        }
    }
}
//////////////////////////////////////////////////////

node {
    stage('Deploy Development') {
        unstash "builtSources"
        uploadArtifactory('TransceiverToolbox','*.mltbx')
    }
    if (env.BRANCH_NAME == 'master') {
        stage('Deploy Production') {
            unstash "builtSources"
            uploadFTP('TransceiverToolbox','*.mltbx')
        }
    }
}

