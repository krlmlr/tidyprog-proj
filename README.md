# Programming in the tidyverse

RStudio project and supporting files for a quick start of the workshop.

## Requirements

1. A working rstudio.cloud setup

2. (Optional) A local installation

3. Review the intro R script.


**NOTE**: Unfortunately we cannot help you troubleshoot problems with your system setup during the workshop.  The cloud instance is an RStudio IDE that works from your browser, with R and all packages preinstalled.  It should work reasonably well in a modern browser (Chrome or Firefox) on any operating system.  Please make sure that you have access to the cloud instance before the workshop.  Ideally you can install and use R on your local machine, but we have experienced various problems in the past.


### rstudio.cloud

Navigate to https://rstudio.cloud/project/329883. (Please use a modern browser, Firefox or Chrome should work reasonably well.) A login page appears. To create an account, please click the "Sign up" link at the bottom right of the sign in page. You can also sign in with a GitHub or Google account.

After signing in, please wait for a few seconds for the project to open. In the "Console" tab, type: `library(tidyverse)` (enter). You should see output similar to the following:

```
> library(tidyverse)
── Attaching packages ──────────────────────── tidyverse 1.2.1 ──
✔ ggplot2 3.1.0       ✔ purrr   0.3.2  
✔ tibble  2.1.1       ✔ dplyr   0.8.0.1
✔ tidyr   0.8.3       ✔ stringr 1.4.0  
✔ readr   1.3.1       ✔ forcats 0.4.0  
── Conflicts ─────────────────────────── tidyverse_conflicts() ──
✖ dplyr::filter() masks stats::filter()
✖ dplyr::lag()    masks stats::lag()
```


### Alternative: Local installation

1. Install R, preferably in the most recent version.

    - Windows: https://cran.r-project.org/bin/windows/base/
    - Mac OS: https://cran.r-project.org/bin/macosx/
    - Linux: Use your system's package manager, or https://cran.r-project.org/bin/linux/

2. Install RStudio, preferably in the most recent version.

    https://www.rstudio.com/products/rstudio/download/#download

3. Install R packages. Start RStudio, copy the following code at once into RStudio's "Console" pane and press "Enter".

    ```r
    install.packages(c(
      "tidyverse", "darksky", "here", "conflicted", "shiny", "leaflet", "plotly"
    ))
    ```

4. To test the installation, type `library(tidyverse)` (enter) in the console tab. You should see output similar to the following:

    ```
    > library(tidyverse)
    ── Attaching packages ──────────────────────── tidyverse 1.2.1 ──
    ✔ ggplot2 3.1.0       ✔ purrr   0.3.2  
    ✔ tibble  2.1.1       ✔ dplyr   0.8.0.1
    ✔ tidyr   0.8.3       ✔ stringr 1.4.0  
    ✔ readr   1.3.1       ✔ forcats 0.4.0  
    ── Conflicts ─────────────────────────── tidyverse_conflicts() ──
    ✖ dplyr::filter() masks stats::filter()
    ✖ dplyr::lag()    masks stats::lag()
    ```

5. Close RStudio.

6. Download this project. Click the green "Clone or download" button on the top of this page, then click the "Download ZIP" link.

7. Extract the downloaded file to a directory on your computer. (Opening the file is not sufficient, you need to extract the contents.)

8. Open the `R-workshop.Rproj` file.

### Intro script

Please review the [introductory script located in `script/01-intro.R`](script/01-intro.R).  You should be able to open and run it directly in rstudio.cloud or from the RStudio session that starts after opening the `R-workshop.Rproj` file.


## Material

https://bit.ly/tidyprog
