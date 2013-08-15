export M2_HOME=/home/rrglomsk/uportal/maven

export M2=$M2_HOME/bin
export PATH=$M2:$PATH
export JAVA_HOME=/opt/jdk1.6.0_45
export PATH=$JAVA_HOME/bin:$PATH

EDITOR=vim; export EDITOR

alias javadoc7='/opt/jdk1.7.0_21/bin/javadoc'

alias grades='cd ~/portlet_mygrades/src/main/java/edu/oakland/mygrades/mvc/portlet'

alias searc='cd /home/rrglomsk/uportal/uPortal/uportal-war/src/main/java/org/jasig/portal/portlets/search'


alias det='cd ~/portlet_mydetails/src/main/java/edu/oakland/mydetails/mvc/portlet'

alias sched='cd /home/rrglomsk/portlet_classschedule/src/main/java/edu/oakland/classschedule/mvc'

alias temp='cd /home/rrglomsk/portlet_degreeprogress/src/main/java/org/jasig/portlet/courses/degreeprogress/service/banner'

alias webapp='/home/rrglomsk/uportal/uPortal/bin/webapp_cntl.sh'
alias catalina='rainbowize tail -f /home/rrglomsk/uportal/tomcat/logs/catalina.out'

export ANT_HOME=/home/rrglomsk/uportal/ant
export PATH=$PATH:$ANT_HOME/bin
export PGHOME=/opt/PostgreSQL/9.2/
export PGADMINHOME=/opt/PostgreSQL/9.2/pgAdmin3
export PATH=$PGHOME/bin:$PGADMINHOME/bin:$PATH
export TOMCAT_HOME=/home/rrglomsk/uportal/tomcat
export JAVA_OPTS="-server -XX:MaxPermSize=512m -Xms1024m -Xmx2048m"
export PATH=$PATH:$TOMCAT_HOME
export GROOVY_HOME=/home/rrglomsk/uportal/groovy
export PATH=$PATH:$GROOVY_HOME/bin

alias ..="cd .."
alias ..2="cd ../.."
alias ..3="cd ../../.."
alias ..4="cd ../../../.."
alias ..5="cd ../../../../.." 

alias psiman='/home/rrglomsk/test/probe_manager/psiman'

alias tomcat='/etc/init.d/uportal'

function yank {
    touch ~/.clipboard
    for i in "$@"; do
        if [[ $i != /* ]]; then i=$PWD/$i; fi
        i=${i//\\/\\\\}; i=${i//$'\n'/$'\\\n'}
        printf '%s\n' "$i"
    done >> ~/.clipboard
}

function put {
    while IFS= read src; do
        cp -Rdp "$src" .
    done < ~/.clipboard
    rm ~/.clipboard
}

function putrm {
    while IFS= read src; do
        mv "$src" .
    done < ~/.clipboard
    rm ~/.clipboard
}

cdls() { cd "$@" && ls; }
alias cd='cdls' 

function search {
if [[ "$1" == "-f" ]]
then
   find . -name "*.$2" -print | xargs grep -n -i --color=auto "$3"
else
   find . -type f -print | xargs grep -n -i --color=auto "$1"
fi
}

function hello {
echo $@
}

# Usage: build [(portlet)|uportal]
function build {
    cwd=$(pwd)
    builtin cd ~/uportal/uPortal
    for arg in "$@"
    do  
        if [[ $arg == "uportal" ]]; then
            groovy -Dbuild.portlets.skip=true build.groovy
        else
            groovy -Dbuild.target.portlet=$arg build.groovy    
        fi  
    done
    builtin cd $cwd
}


