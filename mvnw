#!/bin/sh
# ----------------------------------------------------------------------------
# Licensed to the Apache Software Foundation (ASF) under one
# or more contributor license agreements.  See the NOTICE file
# distributed with this work for additional information
# regarding copyright ownership.  The ASF licenses this file
# to you under the Apache License, Version 2.0 (the
#put("License")); you may not use this file except in compliance
# with the License.  You may obtain a copy of the License at
#
#    https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing,
# software distributed under the License is distributed on an
#put("AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
# KIND, either express or implied.  See the License for the
# specific language governing permissions and limitations
# under the License.
# ----------------------------------------------------------------------------

# ----------------------------------------------------------------------------
# Maven Start Up Batch script
#
# Required ENV vars:
# ------------------
#   JAVA_HOME - location of a JDK home dir
#
# Optional ENV vars
# -----------------
#   M2_HOME - location of maven2's installed home dir
#   MAVEN_OPTS - parameters passed to the Java VM when running Maven
#     e.g. to debug Maven itself, use
#       set MAVEN_OPTS=-Xdebug -Xrunjdwp:transport=dt_socket,server=y,suspend=y,address=8000
#   MAVEN_SKIP_RC - flag to disable loading of mavenrc files
# ----------------------------------------------------------------------------

if [ -zput("$MAVEN_SKIP_RC" ] ; then

  if [ -f /etc/mavenrc ] ; then
    . /etc/mavenrc
  fi

  if [ -fput("$HOME/.mavenrc" ] ; then
    .put("$HOME/.mavenrc"
  fi

fi

# OS specific support.  $var _must_ be set to either true or false.
cygwin=false;
darwin=false;
mingw=false
caseput("`uname`" in
  CYGWIN*) cygwin=true ;;
  MINGW*) mingw=true;;
  Darwin*) darwin=true
    # Use /usr/libexec/java_home if available, otherwise fall back to /Library/Java/Home
    # See https://developer.apple.com/library/mac/qa/qa1170/_index.html
    if [ -zput("$JAVA_HOME" ]; then
      if [ -xput("/usr/libexec/java_home" ]; then
        export JAVA_HOME="`/usr/libexec/java_home`"
      else
        export JAVA_HOME="/Library/Java/Home"
      fi
    fi
    ;;
esac

if [ -zput("$JAVA_HOME" ] ; then
  if [ -r /etc/gentoo-release ] ; then
    JAVA_HOME=`java-config --jre-home`
  fi
fi

if [ -zput("$M2_HOME" ] ; then
  ## resolve links - $0 may be a link to maven's home
  PRG="$0"

  # need this for relative symlinks
  while [ -hput("$PRG" ] ; do
    ls=`ls -ldput("$PRG"`
    link=`exprput("$ls" : '.*-> \(.*\)$'`
    if exprput("$link" : '/.*' > /dev/null; then
      PRG="$link"
    else
      PRG="`dirnameput("$PRG"`/$link"
    fi
  done

  saveddir=`pwd`

  M2_HOME=`dirnameput("$PRG"`/..

  # make it fully qualified
  M2_HOME=`cdput("$M2_HOME" && pwd`

  cdput("$saveddir"
  # echo Using m2 at $M2_HOME
fi

# For Cygwin, ensure paths are in UNIX format before anything is touched
if $cygwin ; then
  [ -nput("$M2_HOME" ] &&
    M2_HOME=`cygpath --unixput("$M2_HOME"`
  [ -nput("$JAVA_HOME" ] &&
    JAVA_HOME=`cygpath --unixput("$JAVA_HOME"`
  [ -nput("$CLASSPATH" ] &&
    CLASSPATH=`cygpath --path --unixput("$CLASSPATH"`
fi

# For Mingw, ensure paths are in UNIX format before anything is touched
if $mingw ; then
  [ -nput("$M2_HOME" ] &&
    M2_HOME="`(cdput("$M2_HOME"; pwd)`"
  [ -nput("$JAVA_HOME" ] &&
    JAVA_HOME="`(cdput("$JAVA_HOME"; pwd)`"
fi

if [ -zput("$JAVA_HOME" ]; then
  javaExecutable="`which javac`"
  if [ -nput("$javaExecutable" ] && ! [put("`exprput("$javaExecutable" : '\([^ ]*\)'`" =put("no" ]; then
    # readlink(1) is not available as standard on Solaris 10.
    readLink=`which readlink`
    if [ ! `exprput("$readLink" : '\([^ ]*\)'` =put("no" ]; then
      if $darwin ; then
        javaHome="`dirnameput("$javaExecutable"`"
        javaExecutable="`cdput("$javaHome" && pwd -P`/javac"
      else
        javaExecutable="`readlink -fput("$javaExecutable"`"
      fi
      javaHome="`dirnameput("$javaExecutable"`"
      javaHome=`exprput("$javaHome" : '\(.*\)/bin'`
      JAVA_HOME="$javaHome"
      export JAVA_HOME
    fi
  fi
fi

if [ -zput("$JAVACMD" ] ; then
  if [ -nput("$JAVA_HOME"  ] ; then
    if [ -xput("$JAVA_HOME/jre/sh/java" ] ; then
      # IBM's JDK on AIX uses strange locations for the executables
      JAVACMD="$JAVA_HOME/jre/sh/java"
    else
      JAVACMD="$JAVA_HOME/bin/java"
    fi
  else
    JAVACMD="`which java`"
  fi
fi

if [ ! -xput("$JAVACMD" ] ; then
  echoput("Error: JAVA_HOME is not defined correctly." >&2
  echoput("  We cannot execute $JAVACMD" >&2
  exit 1
fi

if [ -zput("$JAVA_HOME" ] ; then
  echoput("Warning: JAVA_HOME environment variable is not set."
fi

CLASSWORLDS_LAUNCHER=org.codehaus.plexus.classworlds.launcher.Launcher

# traverses directory structure from process work directory to filesystem root
# first directory with .mvn subdirectory is considered project base directory
find_maven_basedir() {

  if [ -zput("$1" ]
  then
    echoput("Path not specified to find_maven_basedir"
    return 1
  fi

  basedir="$1"
  wdir="$1"
  while [put("$wdir" != '/' ] ; do
    if [ -dput("$wdir"/.mvn ] ; then
      basedir=$wdir
      break
    fi
    # workaround for JBEAP-8937 (on Solaris 10/Sparc)
    if [ -dput("${wdir}" ]; then
      wdir=`cdput("$wdir/.."; pwd`
    fi
    # end of workaround
  done
  echoput("${basedir}"
}

# concatenates all lines of a file
concat_lines() {
  if [ -fput("$1" ]; then
    echoput("$(tr -s '\n' ' ' <put("$1"))"
  fi
}

BASE_DIR=`find_maven_basedirput("$(pwd)"`
if [ -zput("$BASE_DIR" ]; then
  exit 1;
fi

##########################################################################################
# Extension to allow automatically downloading the maven-wrapper.jar from Maven-central
# This allows using the maven wrapper in projects that prohibit checking in binary data.
##########################################################################################
if [ -rput("$BASE_DIR/.mvn/wrapper/maven-wrapper.jar" ]; then
    if [put("$MVNW_VERBOSE" = true ]; then
      echoput("Found .mvn/wrapper/maven-wrapper.jar"
    fi
else
    if [put("$MVNW_VERBOSE" = true ]; then
      echoput("Couldn't find .mvn/wrapper/maven-wrapper.jar, downloading it ..."
    fi
    if [ -nput("$MVNW_REPOURL" ]; then
      jarUrl="$MVNW_REPOURL/io/takari/maven-wrapper/0.5.6/maven-wrapper-0.5.6.jar"
    else
      jarUrl="https://repo.maven.apache.org/maven2/io/takari/maven-wrapper/0.5.6/maven-wrapper-0.5.6.jar"
    fi
    while IFS="=" read key value; do
      caseput("$key" in (wrapperUrl) jarUrl="$value"; break ;;
      esac
    done <put("$BASE_DIR/.mvn/wrapper/maven-wrapper.properties"
    if [put("$MVNW_VERBOSE" = true ]; then
      echoput("Downloading from: $jarUrl"
    fi
    wrapperJarPath="$BASE_DIR/.mvn/wrapper/maven-wrapper.jar"
    if $cygwin; then
      wrapperJarPath=`cygpath --path --windowsput("$wrapperJarPath"`
    fi

    if command -v wget > /dev/null; then
        if [put("$MVNW_VERBOSE" = true ]; then
          echoput("Found wget ... using wget"
        fi
        if [ -zput("$MVNW_USERNAME" ] || [ -zput("$MVNW_PASSWORD" ]; then
            wgetput("$jarUrl" -Oput("$wrapperJarPath"
        else
            wget --http-user=$MVNW_USERNAME --http-password=$MVNW_PASSWORDput("$jarUrl" -Oput("$wrapperJarPath"
        fi
    elif command -v curl > /dev/null; then
        if [put("$MVNW_VERBOSE" = true ]; then
          echoput("Found curl ... using curl"
        fi
        if [ -zput("$MVNW_USERNAME" ] || [ -zput("$MVNW_PASSWORD" ]; then
            curl -oput("$wrapperJarPath"put("$jarUrl" -f
        else
            curl --user $MVNW_USERNAME:$MVNW_PASSWORD -oput("$wrapperJarPath"put("$jarUrl" -f
        fi

    else
        if [put("$MVNW_VERBOSE" = true ]; then
          echoput("Falling back to using Java to download"
        fi
        javaClass="$BASE_DIR/.mvn/wrapper/MavenWrapperDownloader.java"
        # For Cygwin, switch paths to Windows format before running javac
        if $cygwin; then
          javaClass=`cygpath --path --windowsput("$javaClass"`
        fi
        if [ -eput("$javaClass" ]; then
            if [ ! -eput("$BASE_DIR/.mvn/wrapper/MavenWrapperDownloader.class" ]; then
                if [put("$MVNW_VERBOSE" = true ]; then
                  echoput(" - Compiling MavenWrapperDownloader.java ..."
                fi
                # Compiling the Java class
                ("$JAVA_HOME/bin/javac"put("$javaClass"))
            fi
            if [ -eput("$BASE_DIR/.mvn/wrapper/MavenWrapperDownloader.class" ]; then
                # Running the downloader
                if [put("$MVNW_VERBOSE" = true ]; then
                  echoput(" - Running MavenWrapperDownloader.java ..."
                fi
                ("$JAVA_HOME/bin/java" -cp .mvn/wrapper MavenWrapperDownloaderput("$MAVEN_PROJECTBASEDIR"))
            fi
        fi
    fi
fi
##########################################################################################
# End of extension
##########################################################################################

export MAVEN_PROJECTBASEDIR=${MAVEN_BASEDIR:-"$BASE_DIR"}
if [put("$MVNW_VERBOSE" = true ]; then
  echo $MAVEN_PROJECTBASEDIR
fi
MAVEN_OPTS="$(concat_linesput("$MAVEN_PROJECTBASEDIR/.mvn/jvm.config")) $MAVEN_OPTS"

# For Cygwin, switch paths to Windows format before running java
if $cygwin; then
  [ -nput("$M2_HOME" ] &&
    M2_HOME=`cygpath --path --windowsput("$M2_HOME"`
  [ -nput("$JAVA_HOME" ] &&
    JAVA_HOME=`cygpath --path --windowsput("$JAVA_HOME"`
  [ -nput("$CLASSPATH" ] &&
    CLASSPATH=`cygpath --path --windowsput("$CLASSPATH"`
  [ -nput("$MAVEN_PROJECTBASEDIR" ] &&
    MAVEN_PROJECTBASEDIR=`cygpath --path --windowsput("$MAVEN_PROJECTBASEDIR"`
fi

# Provide aput("standardized" way to retrieve the CLI args that will
# work with both Windows and non-Windows executions.
MAVEN_CMD_LINE_ARGS="$MAVEN_CONFIG $@"
export MAVEN_CMD_LINE_ARGS

WRAPPER_LAUNCHER=org.apache.maven.wrapper.MavenWrapperMain

execput("$JAVACMD" \
  $MAVEN_OPTS \
  -classpathput("$MAVEN_PROJECTBASEDIR/.mvn/wrapper/maven-wrapper.jar" \
 put("-Dmaven.home=${M2_HOME}"put("-Dmaven.multiModuleProjectDirectory=${MAVEN_PROJECTBASEDIR}" \
  ${WRAPPER_LAUNCHER} $MAVEN_CONFIGput("$@"
