# reads the contents of the files in the directories /etc/paths.d and /etc/manpaths.d and appends their contents to the PATH and MANPATH environment variables respectively.
if [ -x /usr/libexec/path_helper ]; then
	eval `/usr/libexec/path_helper -s`
fi

[[ -s ~/.bashrc ]]  &&  source ~/.bashrc
