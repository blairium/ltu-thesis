# *(Unofficial)* La Trobe PhD Thesis LaTeX Template

This is a slightly modified version of [Bashimao's](https://github.com/bashimao/ltu-thesis) La Trobe latex template based on the classicthesis thesis template by [André Miede](https://bitbucket.org/amiede/classicthesis).

T've made slight changes so that the margins meet the requirements of the physics department. I've changed the language to Australian. I've also added an acronym page. 



## Organization
`thesis.tex` is the root document and includes the individual chapters. The content of the chapters can be found under `text/`. It is pretty self-explaining. Figures should be placed under `figures/`. Bibliography should be put into `library.bib`.

## Configuration
You should replace the configuration at the top of `thesis.tex` with your actual information. That's it!

    % Thesis and submission:
    \newcommand{\myTitle}{Using Thinking Machines to Alleviate our Dependency on Guild Navigators}
    \newcommand{\mySubmissionYear}{2018}
    \newcommand{\mySubmissionMonth}{October}
    \newcommand{\mySubmissionDay}{31}

    % Regarding yourself:
    \newcommand{\myFirstName}{Feyd-Rautha}
    \newcommand{\myLastName}{Harkonnen}
    \newcommand{\myWebsite}{https://en.wikipedia.org/wiki/Feyd-Rautha}
    \newcommand{\myBirthYear}{1965}
    \newcommand{\myBirthMonth}{January}
    \newcommand{\myBirthDay}{31}
    \newcommand{\myBirthPlace}{Lankiveil}

    % Primary supervisor:
    \newcommand{\myProfTitle}{Prof.}
    \newcommand{\myProfFirstName}{Piter}
    \newcommand{\myProfLastName}{De Vries}
    \newcommand{\myProfWebsite}{http://homepage.cs.latrobe.edu.au/pdevries}

    % Co-supervisor:
    \newcommand{\myOtherProfTitle}{Dr}
    \newcommand{\myOtherProfFirstName}{Thufir}
    \newcommand{\myOtherProfLastName}{Hawat}
    \newcommand{\myOtherProfWebsite}{http://homepage.cs.latrobe.edu.au/hthufir}

    % University related:
    \newcommand{\myDepartment}{Department of Computer Science and Information Technology}
    \newcommand{\myFaculty}{College of Science, Health and Engineering}
    \newcommand{\mySchool}{School of Engineering and Mathematical Sciences}
    \newcommand{\myUni}{La Trobe University}


