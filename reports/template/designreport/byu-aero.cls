%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% byu-aero.cls, v1.1, 2020/01/04
% Developed by Judd Mehr
% 
% This class file enables authors to prepare contracts, proposals, and design reports
% related to the AIAA Design Build Fly Competition
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
\ProvidesClass{byu-aero}[2020/01/04, v1.0]

\newif\if@proposal
\DeclareOption{proposal}{\@proposaltrue}
\newif\if@report
\DeclareOption{report}{\@reporttrue}
\newif\if@contract
\DeclareOption{contract}{\@contracttrue}

\ExecuteOptions{}
\ProcessOptions\relax
\LoadClass[10pt]{article}


\RequirePackage[usenames,dvipsnames]{color}% This loads a package that allows extra colors for links.
\definecolor{BYUblue}{RGB}{0,46,93}
\definecolor{BYUbluelite}{RGB}{221,227,233}
\definecolor{BYUbluemid}{RGB}{151,169,189}
\definecolor{BYUred}{RGB}{162, 0, 0}
\definecolor{BYUredlite}{RGB}{233,71,71}
\definecolor{BYUgreen}{RGB}{93,162,93}
\definecolor{BYUgreenlite}{RGB}{164,233,164}
\definecolor{BYUgray}{RGB}{128,128,128}
%tikz colors:
\newcommand{\BYUblue}{rgb,255:red,0; green,46; blue,93}
\newcommand{\BYUbluelite}{rgb,255:red,221; green,227; blue,233}
\newcommand{\BYUbluemid}{rgb,255:red,151; green,169; blue,189}
\newcommand{\BYUred}{rgb,255:red,162; green,0; blue,0}
\newcommand{\BYUredlite}{rgb,255:red,223; green,71; blue,71}
\newcommand{\BYUgreen}{rgb,255:red,93; green,162; blue,93}
\newcommand{\BYUgreenlite}{rgb,255:red,164; green,233; blue,164}
\newcommand{\BYUgray}{rgb,255:red,128; green,128; blue,128}

\RequirePackage[T1]{fontenc}
\RequirePackage[utf8]{inputenc}
\RequirePackage{microtype}
\RequirePackage{newtxtext,newtxmath}

\RequirePackage{lipsum}

\RequirePackage[letterpaper,
				left=0.35in,
				right=0.35in,
				top=0.75in,
				bottom=0.5in,
				footskip=0.25in,
				headheight=0.75in,
				headsep=0.125in,
				marginparsep=0pt,
%				showframe
				]{geometry}


\RequirePackage{enumitem}
\setlist{labelindent=\parindent,leftmargin=*,nosep}
\setlist[enumerate]{label={\arabic*)}}


\RequirePackage[symbol*]{footmisc}

%This allows the insertion of full page pdfs
\RequirePackage{pdfpages}


\RequirePackage{setspace}
\spacing{1.5}


\RequirePackage[explicit]{titlesec}
%\renewcommand{\thesection}{\Roman{section}}
%\renewcommand{\thesubsection}{\thesection.\Alph{subsection}}
%\renewcommand{\thesubsubsection}{\thesubsection.\arabic{subsubsection}}
\titleformat{\section}
  {\color{BYUblue}\bfseries\singlespacing}
  {\Roman{section}\space\space}{0pt}{#1}[]
\titlespacing{\section}{0pt}{-1ex}{-1ex}
\titleformat{\subsection}
  {\color{BYUblue}\normalsize\bfseries\singlespacing}
  {\Roman{section}.\Alph{subsection}\space\space}{0pt}{#1}[]
\titlespacing{\subsection}{1ex}{-1ex}{-0.5ex}
\titleformat{\subsubsection}
{\color{BYUblue}\normalsize\bfseries\singlespacing}
{\Roman{section}.\Alph{subsection}.\arabic{subsubsection}\space\space}{0pt}{#1}[]
\titlespacing{\subsubsection}{2ex}{-1.5ex}{-0.5ex}
\titleformat{\paragraph}[runin]
	{\normalfont\normalsize\slshape\color{\BYUblue}}
	{}{0pt}{#1}[]
\titlespacing{\paragraph}{-1pt}{-1pt}{1ex}

%\titlespacing*{\section}{0pt}{-5pt}{0pt}


\RequirePackage[tableposition=top,font=small,bf]{caption}
\renewcommand{\figurename}{\color{\BYUblue}Figure}
\renewcommand{\thefigure}{\color{\BYUblue}\arabic{figure}}
\renewcommand{\tablename}{\color{\BYUblue}Table}
\renewcommand{\thetable}{\color{\BYUblue}\arabic{table}}
\captionsetup*{labelsep=space}
\RequirePackage{subcaption}
\renewcommand{\thesubfigure}{\color{\BYUblue}\alph{subfigure})}
\captionsetup[subfigure]{labelsep=space,labelformat=simple}

\renewcommand{\arraystretch}{1.2}


\setlength{\abovedisplayskip}{\baselineskip}
\setlength{\belowdisplayskip}{\baselineskip}
\setlength{\abovedisplayshortskip}{\baselineskip}
\setlength{\belowdisplayshortskip}{\baselineskip}

%BIBILOGRAPHY
\RequirePackage[sort&compress,numbers]{natbib}
% \bibliographystyle{aiaa}
\bibliographystyle{new-aiaa}
\renewcommand{\bibfont}{\small}

%IN TEXT REFERENCES/HYPERLINKS
\RequirePackage[hyphens]{url}
\RequirePackage{hyperref}
\hypersetup{
	colorlinks = true,
	citecolor=BYUblue,
	linkcolor=BYUblue,
	urlcolor=BYUblue,
	filecolor=BYUblue,
	linktoc=all}
\usepackage[noabbrev]{cleveref}


%CUSTOM ADDED STUFF
%FIGURES
\RequirePackage[]{graphicx}
\graphicspath{{./figures/}}
\RequirePackage{wrapfig}

%tables
\RequirePackage[table]{xcolor}
\RequirePackage{multirow}
%\usepackage{booktabs}

%%TIKZ
\usepackage{tikz}
%Flowchart option 1
\usetikzlibrary{trees}
%Flowchart option 2
\RequirePackage[edges]{forest}
\usetikzlibrary{arrows.meta}% arrows is deprecated
\tikzset{% \tikzstyle is deprecated
	block/.style={rectangle, draw=\BYUblue, fill=\BYUbluelite, text=\BYUblue, text width=10em, text centered, rounded corners, minimum height=4em},
	line/.style={draw, very thick, color=\BYUblue, -Stealth},
}

%Organization Chart:

\tikzstyle{block} = 
[
rectangle
, draw=\BYUblue
, fill=\BYUbluelite
, text width=7em
, text centered
, node distance=0cm
, rounded corners
, minimum height=1.5em
]

\tikzstyle{block2} = 
[
rectangle
, draw=\BYUblue
, fill=\BYUbluelite
, text width=5em
, text centered
, node distance=0cm
, rounded corners
, minimum height=1.5em
]

\tikzstyle{line} = 
[
draw
]


%XDSM Chart
\RequirePackage{amsfonts}
%\RequirePackage{amssymb}
% Define the set of tikz packages to be included in the architecture diagram document
\usetikzlibrary{arrows,chains,positioning,scopes,shapes.geometric,shapes.misc,shadows} 
% Set the border around all of the architecture diagrams to be tight to the diagrams themselves
% (i.e. no longer need to tinker with page size parameters)
%\RequirePackage[active,tightpage]{preview}
%\PreviewEnvironment{tikzpicture}
%\setlength{\PreviewBorder}{5pt}

%mathpackages
\RequirePackage{amsmath}
\RequirePackage{siunitx}
\RequirePackage{mathrsfs}
\newcommand{\vect}{\overset{\rightharpoonup}}
\RequirePackage{nicefrac}

%Header/Footer
\RequirePackage{lastpage}
\RequirePackage{fancyhdr}   % simple control of headers and footers

\fancyhf{}
\lhead{\includegraphics[height=0.5in]{Logo5.png}}
\rhead{\ifthenelse{\isodd{\value{page}}}{\includegraphics[height=0.5in]{byu-logo.png}}{\includegraphics[height=0.5in]{dbf-logo.png}}}
\cfoot{\color{BYUblue} \underline{~~\thepage\ of \pageref{LastPage}~~}}
\fancyhfoffset[L]{0.2in}
\fancyhfoffset[R]{0.2in}
\pagestyle{fancy}

\fancypagestyle{tocpage}{\lhead{} \rhead{} \lfoot{} \rfoot{} \cfoot{\color{BYUblue} \underline{~~\thepage\ of \pageref{LastPage}~~}}}
\renewcommand{\headrulewidth}{0pt} % This eliminates the line at the top of pages.

\newcommand\NextYear{%
   \advance\year by 1 \the\year\advance\year by -1}
   
\if@proposal %
\chead{
\parbox[b][3em][t]{0.75\textwidth}{
\centering
\Large{\color{BYUblue} Brigham Young University Aeronautics Club}\\
\small{\NextYear~AIAA Design Build Fly Competition Proposal}}
}
\fi

\if@report %
\chead{
	\parbox[b][3em][t]{0.75\textwidth}{
		\centering
		\Large{\color{BYUblue} Brigham Young University Aeronautics Club}\\
		\small{\NextYear~AIAA Design Build Fly Competition Design Report}}
}
\fi

\if@contract %
\chead{
	\parbox[b][3em][t]{0.75\textwidth}{
		\centering
		\Large{\color{BYUblue} Brigham Young University Aeronautics Club}\\
		\small{AIAA Design Build Fly Team Contract}}
}
\fi

%Fix spacing in Table of Contents
\RequirePackage{titletoc}
\titlecontents{section}
[3em]
{\addvspace{1em}\color{BYUblue}\bfseries}
{\contentslabel{2em}}
{\hspace*{1em}}
{\hfill\contentspage}


\titlecontents{subsection}
[6em]
{\addvspace{0em}\color{BYUblue}}
{\contentslabel{3em}}
{\hspace*{0em}}
{\hfill\contentspage}

