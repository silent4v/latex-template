# 主要目標：先建立目錄結構再執行 latexmk
all: prepare_dirs
	latexmk -xelatex main.tex

# 掃描當前資料夾並建立 build/ 中的相對子目錄
prepare_dirs:
	@echo "Preparing directory structure under build/"
	@echo "Workdir=`pwd`"
	@find . -name '*.tex' -exec dirname {} \; | sort -u | \
	while read dir; do \
		subdir=$${dir#./}; \
		mkdir -p build/$$subdir; \
	done

# 清除中間檔案（如果你想用 latexmk clean）
clean:
	latexmk -c

# 完全清除（包含 build/ 資料夾）
cleanall:
	latexmk -C
	rm -rf build
