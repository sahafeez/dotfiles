function cl() {
    DIR="$*";
        # if no DIR given, go home
        if [ $# -lt 1 ]; then 
                DIR=$HOME;
    fi;
    builtin cd "${DIR}" && \
        ls-go -alkSi   
}