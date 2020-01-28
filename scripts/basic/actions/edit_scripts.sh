editscripts() {
    printf "Filename (Default: temp):"
    read filename
    printf "Path (Default: ~/temp):"
    read path
    default_filename="temp"
    default_path="~/temp"
    default_editor="nano"

    if [ -z $filename ]
    then
        filename=$default_filename
    fi

    if [ "$path" = "s" ]
    then
        path="/usr/local/scripts"
    elif [ -z $path ]
    then
        path=$default_path
    fi
    echo "Choose editor (Default: Nano): (1) Nano   (2) Atom"
    read editor_num

    case $editor_num in
        1) editor="nano"
        ;;
        2) editor="atom"
        ;;
        *) editor=$default_editor
        ;;
    esac

    command="$editor $path/$filename.sh"
    if [[ "$(whoami)" != "root" && "$path" = "/usr/local/scripts" ]]
    then
        command="sudo $command"
    fi

    $command
}
