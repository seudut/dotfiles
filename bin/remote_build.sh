#/bin/bash

svn diff > temp.diff
scp temp.diff cpvedev@cpvedev:cpve_trunk/

ssh cpvedev@cpvedev 'cd ~/cpve_trunk && \
    svn revert -R . && \
    patch -p0 < temp.diff &&\
    scons arch=arm platform=android debug=True -j4  androidndk=/opt/android-ndk'
scp cpvedev@cpvedev:cpve_trunk/target/run/Debug/acpvetest.apk ~/CPVE/cpve_trunk/temp/run/Release/
scp cpvedev@cpvedev:cpve_trunk/target/run/Debug/run_monkey.sh ~/CPVE/cpve_trunk/temp/run/Release/
#scp cpvedev@cpvedev:cpve_trunk/target/run/Debug/monkeytalk-runner.jar ~/CPVE/cpve_trunk/temp/run/Release/
