BREW_PATH = $(shell which brew)
TIDY_PACKAGE = tidy-html5
TIDY_PATH = /usr/local/Cellar/tidy-html5/5.6.0/bin/tidy
TIDY_CONFIG_TXT = ./tidy-config.txt
TIDY_OPTIONS = $(shell echo '-config $(TIDY_CONFIG_TXT)' )

install : check
	$(BREW_PATH) install $(TIDY_PACKAGE)

uninstall: check
	$(BREW_PATH) uninstall $(TIDY_PACKAGE)

check :
	@if ! (type $(BREW_PATH) > /dev/null 2>&1) ; then echo "NotFound brew!" ; fi;

tidy :
	@for each in `find . -name *.html` ; do echo "format $${each}" ; $(TIDY_PATH) $(TIDY_OPTIONS) $${each} > output.txt ; mv output.txt $${each} ; done
	