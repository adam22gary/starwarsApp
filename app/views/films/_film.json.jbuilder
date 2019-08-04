json.extract! film, :id, :title, :opening_crawl, :director, :producer, :release_date, :characters, :planets, :starships, :vehicles, :species, :user_id, :created_at, :updated_at
json.url film_url(film, format: :json)
