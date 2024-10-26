SHELL:=/bin/bash

# DEST=$(HOME)/.local
# DEST=/usr/local
DEST=result
BINS=$(DEST)/bin
APPS=$(DEST)/share/applications
ICOS=$(DEST)/share/icons

# ICON_FILES=assets/org.ffmpeg.FFmpeg.svg "test/my file with spaces"
ICON_FILES=assets/org.ffmpeg.FFmpeg.svg
APPLICATION_FILES=src/ico/org.ffmpeg.FFplayIco.desktop src/video/org.ffmpeg.FFplay.desktop
SCRIPT_FILES=src/ico/ffplay-ico-wrapper

.PHONY: all install clean

all: install

install: target "$(ICOS)" "$(APPS)" "$(BINS)"
	cp target/icons/* "$(ICOS)"
	cp target/applications/* "$(APPS)"
	cp target/bin/* "$(BINS)"

uninstall:
	cd "$(ICOS)" && for f in $(ICON_FILES) ; do \
		rm "$$(basename "$$f")" ; done
	cd "$(APPS)" && for f in $(APPLICATION_FILES) ; do \
		rm "$$(basename "$$f")" ; done
	cd "$(BINS)" && for f in $(SCRIPT_FILES) ; do \
		rm "$$(basename "$$f")" ; done

target:
	@mkdir -p target/{icons,applications,bin}
	cp $(ICON_FILES) target/icons
	cp $(APPLICATION_FILES) target/applications
	cp $(SCRIPT_FILES) target/bin

clean:
	rm -r target
	-rm -r result

"$(BINS)":
	mkdir -p "$(BINS)"

"$(ICOS)":
	mkdir -p "$(ICOS)"

"$(APPS)":
	mkdir -p "$(APPS)"
