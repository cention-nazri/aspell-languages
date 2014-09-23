ftp = ftp://ftp.gnu.org/gnu/aspell/dict

tarballs =

all:
	if [ -n "$(tarballs)" ]; then \
		for url in $(tarballs); do \
			./get-extract-add.sh $(ftp)/$$url; \
		done; \
	fi
