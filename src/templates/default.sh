#!/bin/bash

doc_class=$1; shift
title=$1; shift
author=$1; shift

tpl1='\usepackage{natbib} % Required to change bibliography style to APA
\usepackage{graphicx} % Required for the inclusion of images

% Maths --------------------------------
\usepackage[centertags]{amsmath}
\usepackage{amssymb,amsthm,amsfonts,bm} %bold maths
\newcommand{\textoverline}[1]{$\overline{\mbox{#1}}$} % to use overbar outside math mode
\usepackage{mathtools} % Abs and more...
% --------------------------------------
\usepackage[american]{babel}
\usepackage[utf8]{inputenc}
\usepackage{lmodern}
\usepackage{ae,aecompl} %Font improvements
\usepackage[pdftex]{hyperref}
\usepackage{tabularx,ragged2e,booktabs,caption}
% --------------------------------------
\setlength{\parindent}{1em} % Removes all indentation from paragraphs
\setlength{\parskip}{1em}'

tpl2='\begin{document}

\maketitle

\end{document}
'

doc_class_str="\documentclass[]{${doc_class}}"
title_str="\title{${title}}"
author_str="\author{${author}}"

printf '%s\n\n%s\n\n%s\n%s\n\n%s\n' "$doc_class_str" "$tpl1" "$title_str" "$author_str" "$tpl2" 
