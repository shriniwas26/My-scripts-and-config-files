# Installing mercurial on Ubuntu 20.04

* Clone the following repository
    ```bash
    hg clone https://foss.heptapod.net/mercurial/tortoisehg/thg
    ```

* Update to the following revision
    ```bash
    hg update -r 19902
    ```
    OR
    ```bash
    hg update 2d510130c626
    ```

* Create+activate a conda environment with python=3.7
    ```bash
    conda create --name mercurial-env python=3.7
    conda activate mercurial-env
    ```

* Install basic packages using pip
    ```bash
    pip install mercurial pyqt5 QScintilla iniparse
    ```

* Start thg using
    ```bash
    ./thg/thg
    ```
