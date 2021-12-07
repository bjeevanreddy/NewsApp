# NewsApp for iOS 

A simple NewsApp for iOS mobile devices where users can view latest news.

For the HeadLines tab, we are displaying top 200 headlines from the two sources BBC, ENgadgets.

For the Countries tab, we have designed this screen to display the brief news related to the specific country.

## Team members

- Jeevan Bodigam
- Sharada Devi Noothalapati
- Shivaram Kothapally
- Tejaswini Nallavolu
- Jaya Kumar Saga
- Keethi Muli

We are using the NewsAPI for fetching the news: https://newsapi.org/docs/endpoints/everything

Below are the api links we have used in our Project.

# For Main HeadLines:

HeadLineAPI1="https://newsapi.org/v2/everything?domains=bbc.co.uk&sortBy=publishedAt&pageSize=100&apiKey=0423b0cf114e4c51bd3a1c5efd577578"

HeadLineAPI2="https://newsapi.org/v2/everything?domains=engadget.com&sortBy=publishedAt&pageSize=100&language=en&apiKey=0423b0cf114e4c51bd3a1c5efd577578"


# For Trending News:
TrendingAPI="https://newsapi.org/v2/everything?apiKey=0423b0cf114e4c51bd3a1c5efd577578&sortBy=publishedAt&pageSize=100&language=en&q="

# For County news:
countryAPI="https://newsapi.org/v2/top-headlines?apiKey=0423b0cf114e4c51bd3a1c5efd577578&country="
