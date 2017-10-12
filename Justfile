next:
    @export VERSION=$(cat madlang.cabal | grep -P -o '\d+\.\d+\.\d+\.\d+' madlang.cabal | head -n1 | awk -F. '{$NF+=1; print $0}' | sed 's/ /\./g') && echo $VERSION && sed -i "2s/[0-9]\+\.[0-9]\+\.[0-9]\+\.[0-9]\+/$VERSION/" madlang.cabal

ci:
    cabal new-build
    cabal new-test
    cabal new-bench

size:
    sn d $(fd 'madlang$' -I | tail -n1)

manpages:
    pandoc man/MANPAGE.md -s -t man -o man/madlang.1

upload:
    rm -rf dist/
    cabal sdist
    cabal upload --publish $(fd '\.tar\.gz$' -I)

release:
    git tag "$(grep -P -o '\d+\.\d+\.\d+\.\d+' madlang.cabal | head -n1)"
    git push origin --tags

install:
    cabal new-build --constraint='madlang +llvm-fast'
    cp $(fd 'madlang$' -I | tail -n1) ~/.local/bin

name:
    github-release edit -s $(cat .git-token) -u vmchale -r madlang -n "$(madlang run ~/programming/madlang/releases/releases.mad)" -t "$(grep -P -o '\d+\.\d+\.\d+\.\d+' madlang.cabal | head -n1)"

clean:
    sn c .
    rm -f man/madlang.1 tags
