.DEFAULT_GOAL := check

init:
	@echo "Initialising the project"
	@npm install

test:
	@echo "Testing..."
	@npm run test

build:
	@echo "๐ฉโ๐ญ Building..."
	@npm run build
	@npm run package

check: --pre_check test build
	@echo "โ"

clean:
	@echo "๐ Cleaning..."
	@npm run clean

clean_all: clean
	@echo "๐งจ Clean all"
	@rm -Rf node_modules yarn.lock

release_patch: release

release_minor: check
	@.scripts/finish-release minor

release_major: check
	@.scripts/finish-release major

release: check
	@.scripts/finish-release patch

--pre_check:
	@npm run clean
	@npm install
	@npm run lint
	@npm run type-check
