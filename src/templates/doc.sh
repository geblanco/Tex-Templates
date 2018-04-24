#!/bin/bash

doc_class=$1; shift
title=$1; shift
author=$1; shift

tpl1='\usepackage{graphicx} % Required for the inclusion of images

\usepackage{subfig}
\usepackage[pdftex]{hyperref}

% Maths --------------------------------
\usepackage[centertags]{amsmath}
\usepackage{amssymb,amsthm,amsfonts,bm} %bold maths
\newcommand{\textoverline}[1]{$\overline{\mbox{#1}}$} % to use overbar outside math mode
\newcommand{\textunderline}[1]{$\underline{\mbox{#1}}$} % to use overbar outside math mode
\usepackage{mathtools} % Abs and more...
% --------------------------------------
\usepackage[american]{babel}
\usepackage[utf8]{inputenc}
\usepackage{lmodern}
\usepackage{ae,aecompl} %Font improvements
\usepackage{tabularx,ragged2e,booktabs,caption}
% --------------------------------------
\setlength{\parindent}{1em} % Removes all indentation from paragraphs
\setlength{\parskip}{1em}
\linespread{1.2}

\pagenumbering{arabic} % no page number
\pagestyle{empty}

\usepackage[dvipsnames]{xcolor}
\newcommand{\mktitle}[1]{{\Large {\color{NavyBlue} #1}}}
\newcommand{\mksection}[1]{{\large {\color{NavyBlue} #1}}}'

tpl2='\makeatletter
  \let\thetitle\@title
  \let\theauthor\@author
  \let\thedate\@date
\makeatother

% ToDo := Maybe insert date?
\newcommand{\insertheader}{
  {
    \centering
    \mktitle{
      \textunderline{\thetitle} \par
      \theauthor
    }
    \par
  }
}

\begin{document}

\insertheader


\end{document}
'

doc_class_str="\documentclass[12pt]{report}"
title_str="\title{\textbf{${title}}}"
author_str="\author{${author}}"

printf '%s\n\n%s\n\n%s\n%s\n\n%s\n' "$doc_class_str" "$tpl1" "$title_str" "$author_str" "$tpl2" 
