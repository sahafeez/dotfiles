#go home and ls 
function cl() {
    DIR="$*";
        # if no DIR given, go home
        if [ $# -lt 1 ]; then 
                DIR=$HOME;
    fi;
    builtin cd "${DIR}" && \
        ls-go -alkSn
}

#mkdir and change to it
function mcd () {
    mkdir -p $1
    cd $1
}

#crazy match for music files dir looking for bad naming as i am ocd about this
function ckm () {
    find . | grep -E "(\b \b[a-z][^/]*$|\)\s+\(|[[:space:]]{2,}|[[:blank:]]\.[[:alnum:]]{3}|\Ft\.[[:alnum:]]|7[\']|10[\']|12[\']|[[:blank:]]$)"
}
