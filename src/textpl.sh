#!/bin/bash

cwd="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
doc_classes=("doc" "article" "minimal" "IEEEtran" "proc" "report" "book" "slides" "memoir" "letter" "beamer")

print_doc_classes() {
	local usages=(
		"For a quick draft, provides simple nice header and sections (like a basic word document)..."
		"For articles in scientific journals, presentations, short reports,program documentation, invitations, ..."
		"Is as small as it can get, It only sets a page size and a base font. It is mainly used for debugging purposes."
		"For articles with the IEEE Transactions format."
		"A class for proceedings based on the article class."
		"For longer reports containing several chapters, small books, thesis, ..."
		"For real books."
		"For slides. The class uses big sans serif letters."
		"For changing sensibly the output of the document. It is based on the book class, but you can create any kind of document with it [1]."
		"For writing letters."
		"For writing presentations (see LaTeX/Presentations)."
	)
	echo -e "\nDOC_TYPES:\n\n"
	for (( i = 0; i < ${#doc_classes[*]}; i++ )); do
		echo -e "  ${doc_classes[$i]}: ${usages[$i]}\n"
	done
}

if [[ $# -lt 2 ]]; then
	echo "Usage: textpl <author> <title> <document class>"
	print_doc_classes
	exit 127
fi

author=$1; shift
title=$1; shift
doc_class=$1; shift

default_class=${doc_classes[0]}

lower_title=$(echo $title | tr '[:upper:]' '[:lower:]' | tr ' ' '_')
proj_dir=$lower_title

fix_doc_class() {
	local i=0
	for (( ; i < ${#doc_classes[*]}; i++ )); do
		if [[ ${doc_classes[$i]} == $doc_class ]]; then
			break
		fi
	done
	if [[ $i -ge ${#doc_classes[*]} ]]; then
		doc_class=$default_class
	fi
}

fix_doc_class $doc_class

if [[ -d "${proj_dir}" ]]; then
	echo "Project directory already exists, creating new one..."
	proj_dir="new_${proj_dir}"
fi

mkdir $proj_dir

template="${cwd}/templates/default.sh"

if [[ -f "${cwd}/templates/${doc_class}.sh" ]]; then
	template="${cwd}/templates/${doc_class}.sh"
fi

if [[ -d "${cwd}/templates/${doc_class}_extra" ]]; then
  cp "${cwd}/templates/${doc_class}_extra"/* "${proj_dir}/"
fi

echo "Generated '${doc_class}' template in ${proj_dir}/${lower_title}.tex"
exec ${template} "${doc_class}" "${title}" "${author}" > ${proj_dir}/${lower_title}.tex
