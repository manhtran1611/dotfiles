function _custom_fzf_change_directory
    if [ (count $argv) ]
        fzf --layout=reverse --query="$argv " | perl -pe 's/([ ()])/\\\\$1/g' | read foo
    else
        fzf --layout=reverse | perl -pe 's/([ ()])/\\\\$1/g' | read foo
    end
    if [ $foo ]
        builtin cd $foo
        commandline -r ''
        commandline -f repaint
    else
        commandline ''
    end
end

function custom_fzf_change_directory
    begin
        ghq list -p
        ls -ad * | perl -pe "s#^#$PWD/#" | grep -v \.git
        ls -ad $HOME/Developments/*/* | grep -v \.git
        ls -ad $HOME/.config/*
    end | sed -e 's/\/$//' | awk '!a[$0]++' | _custom_fzf_change_directory $argv
end
