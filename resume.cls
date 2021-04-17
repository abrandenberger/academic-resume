%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Copyright (C) 2021 by Anna Brandenberger
% Modified from a template (C) 2010 by Trey Hunner
%
% Copying and distribution of this file, with or without modification,
% are permitted in any medium without royalty provided the copyright
% notice and this notice are preserved.  This file is offered as-is,
% without any warranty.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\ProvidesClass{resume}[]
\LoadClass[10pt,a4paper]{article}

\usepackage[]{parskip}       % Do not indent paragraphs
\usepackage{array}           % required for boldface tabular columns
\usepackage{ifthen}

\usepackage[explicit]{titlesec}
\usepackage[normalem]{ulem}

\renewcommand{\ULthickness}{.75pt}

\pagestyle{empty}               % resumes do not need page numbers

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% HEADINGS: Commands for printing name and address

\def \addressSep {$\diamond$}         % Set default address seperator

\newcommand\name[1]{
    \MakeUppercase{\namesize \textbf{#1}}
    \nameskip \break
}

\newcommand\contact[3]{%
    \centerline{%
        \makebox[0pt][c]{%
            {#1}~\ \addressSep\ ~{#2}~\ \addressSep\ ~{#3}
        }%
    }%
    \medskip
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% SECTIONS: Create section headings

\font\midheader=cmssbx12 % section headers
\font\smallserif=cmss9 % for subsection headers

\titleformat{\section}% sectioning command formatted
             {\midheader}% font commands 
             {}% label
             {0em}% separation between label and title
             {{#1}~\sout{\hfill}}% before section title

\titlespacing{\section}{0pt}{\bigskipamount}{\medskipamount}

\titleformat{\subsection}% sectioning command formatted
             {\midheader}% font commands 
             {}% label
             {0em}% separation between label and title
             {\sout{\hfill}~{#1}}% before section title
\titlespacing{\subsection}{0pt}{\bigskipamount}{\medskipamount}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% CONTENT
\newenvironment{content}{
  \begin{list}{}{
    \setlength{\leftmargin}{1em}
  }
  \item[]
}{
  \end{list}    
}

% job environment
\newenvironment{position}[5]{
    {\bf #1} \enspace {\em #3}         \hfill         {\bf    #2}%
    \ifthenelse{\equal{#4}{}}{}{  % if prof + location not empty
        \\
        {$\hookrightarrow$ #4}            \hfill          {\em #5}% Stop a space
    }\smallskip
    \begin{list}{\raisebox{0.4ex}{\tiny$\bullet$}\hspace{-1pt}}{\leftmargin=0em}
      \itemsep -0.6em \vspace{-.75em}
}{
    \end{list}
    \sectionskip
}
    
% prize environment 
\newcommand{\prize}[4][n]{
    {\bf #2} \ifthenelse{\equal{#1}{s}}{\enspace {#4}}{}  \hfill {\bf #3}%
    \ifthenelse{\equal{#1}{n}}{
        \\
        {#4}% Stop a space
    }{}%
    % \sectionskip 
}

% project environment
\newenvironment{project}[2]{
    {\bf#1} ({#2})
    \begin{list}{\raisebox{0.4ex}{\tiny$\bullet$}\hspace{-1pt}}{\leftmargin=0em}
}{
    \end{list} 
    \medskip
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% DEFINE FONTS AND SIZES 
\def\namesize{\Large}
\def\nameskip{\smallskip}
\def\addressskip{\smallskip}
\def\sectionskip{\smallskip} % was bigskip
\def\sectionlineskip{\smallskip}

% better fonts
\font\tenb=cmb10
\let\bf=\tenb
\font\tenbx=cmbx10
