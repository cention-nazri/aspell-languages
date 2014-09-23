ftp = ftp://ftp.gnu.org/gnu/aspell/dict

tarballs =
tarballs += da/aspell5-da-1.4.42-1.tar.bz2
tarballs += de/aspell6-de-20030222-1.tar.bz2
tarballs += en/aspell6-en-7.1-0.tar.bz2
tarballs += es/aspell6-es-1.11-2.tar.bz2
tarballs += fi/aspell6-fi-0.7-0.tar.bz2
tarballs += fr/aspell-fr-0.50-3.tar.bz2
tarballs += it/aspell6-it-2.2_20050523-0.tar.bz2
tarballs += lt/aspell6-lt-1.2.1-0.tar.bz2
tarballs += nb/aspell-nb-0.50.1-0.tar.bz2
tarballs += nl/aspell-nl-0.50-2.tar.bz2
tarballs += nn/aspell-nn-0.50.1-1.tar.bz2
tarballs += pl/aspell6-pl-6.0_20061121-0.tar.bz2
tarballs += sv/aspell-sv-0.51-0.tar.bz2

all:
	if [ -n "$(tarballs)" ]; then \
		for url in $(tarballs); do \
			./get-extract-add.sh $(ftp)/$$url; \
		done; \
	fi
