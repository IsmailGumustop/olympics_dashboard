
# 📊 Olympics Dashboard

Welcome to the Modern Olympic Games Dashboard, showcasing data from Athens 1896 to Rio 2016! This dashboard is a visualization tool presenting comprehensive insights and statistics gathered from the history of the Olympic Games. It allows users to explore and analyze various aspects of the Olympics, from medal counts to participating countries and sports.
## 💻 Install and Run
There two ways to install. You can easily install with [Docker](https://www.docker.com/) with following:
```
docker pull ismailgt/olympics_dashboard
```
After pulling Docker image. Run the following command:

```
docker run -p 8180:8180 ismailgt/olympics_dashboard
```
Then, open a browser and you can enter `0.0.0.0:8180` or `localhost:8180`.

In order to clone this repo. Run the following command:

```
git clone IsmailGumustop/olympics_dashboard
cd olympics_dashboard
```
To run the app, execute the following:
```
Rscript app.R
```
After that, open a browser and enter `0.0.0.0:8180` or `localhost:8180`.

## 📖 Credits 
The datasets and vector images used in this project are licensed either Public Domain or CC-BY-SA. 
* The dataset was acquired from [Kaggle](https://www.kaggle.com/datasets/heesoo37/120-years-of-olympic-history-athletes-and-results/data)

* The links of vector images used in this project are listed below:
    * [Olympic Athletics.svg](https://commons.wikimedia.org/wiki/File:Olympic_Athletics.svg)
    * [Swimming pictogram.svg](https://commons.wikimedia.org/wiki/File:Swimming_pictogram.svg)
    * [Fencing_pictogram.svg](https://commons.wikimedia.org/wiki/File:Fencing_pictogram.svg)
    * [Ski_jumping_pictogram.svg](https://commons.wikimedia.org/wiki/File:Ski_jumping_pictogram.svg)
    * [Bobsleigh_pictogram.svg](https://commons.wikimedia.org/wiki/File:Bobsleigh_pictogram.svg)
    * [Curling_pictogram.svg](https://commons.wikimedia.org/wiki/File:Curling_pictogram.svg)

