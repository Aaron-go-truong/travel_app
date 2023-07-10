# Travel GO
Travel GO is is an application to share travel plans online.

## Features
- User can register/update account (email confirm).
- User can create/update travel plans and share with everyone on the system
- User can create/update comments on other users' travel plans.
- User can like/dislike other users' travel plans.
- User can follow/unfollow other users.
- User can receive notifications when a relevant event occurs through real-time notifications.
- Admin can create/update/deactive employees account.

## General Information
- [Ruby]: (v3.1.2) - A dynamic, open source programming language.
- [Ruby on Rails]: (v6.1.7.3) - A full-stack framework, ships with all the tools needed.
- [PostgreSQL] (v1.1) - A powerful, open source object-relational database system.
- [Bootstrap] (v5.2.3) - The most popular CSS Framework for developing responsive and mobile-first websites.
- [StimulusJS] (v3.2.1) - A modest JavaScript framework for the HTML you already have.
- [Redis] (v4.0) - The open source, in-memory data store used by millions of developers as a database, cache, streaming engine, and message broker.
- [Cloudinary] (v1.26.0) - Streamline media management and improve user experience by automatically delivering images and videos, enhanced and optimized for every user.

## Installation
- Install the correct ruby version: `rbenv install 3.1.2`
- Install Node.js (> v8.16.0) and Yarn
- Install Redis server
- Install Rails: `gem install rails -v 6.1.7.3`
- Install bundler: `gem install bundler`
- Install gems: `bundle install`
- Config database at `config/database.yml`
- Add `.env` file
- Setup database: `rails db:setup`
- Start redis server
- Start web server: `rails server`
- Start webpack server: `./bin/webpack-dev-server`

## Deploy

Host in Render: https://travel-app-service.onrender.com

#### 📌 Database Diagram
[![](https://mermaid.ink/img/pako:eNqtVktv4yAQ_isW5zTaJHaS-trVXvahqqu9rCJZBCYJWwMW4LbZNP998aMOjrHTasMJZj5gHh_DHBCRFFCMQH1meKswX4nAjl8alHamwaFaFGPNtkyYgNHAHfdfTwhtFBPbIACOWeoRC6L2mQGaZFjrZ6loF6NAg2n0iZGPIC6iNAiTYHPCUWzAMA4FkgNfg0qIAlxc7YcNa_OMdrRvphApNkxxbJgU5-Y651eovhtah3S8qa_KxekUf4Rzm7JEYA4dDabUxkx7ri4midwka6bMrrNvC4KCcjggZQpYBBQwMewJ6gweV8IhTfJgQboj8HPJ5U8tLd2wqi9dlbIHnatOURxK4nkOG5MdYwfNDLq594a6IKfMFYHE7LMhNaNX8-E-xUI708uhtiLYggowl7nocs0wkzq2G3gxNueaKJYVHNWeDe9hXS1_gh0jTdSbC0pKMcM6CiGNK3uzPbOuJjinzBYW6DhcajOsitc0zDNfXFL2CDoh7eD0sP8KCbyTnFtDdXt1OY11QG1hMNCytN9DNzx-FeGmJ3D_6eW3IqjO9KMFweN5kSe8Ts8fW72x0V7XjwdIy1KtdyzTHtH7n99Gpql8Lr3rVdJrVoof0rANI9h5xS3RuymngLCMFRzxRv6kPqvWb_WitemPlmIdWM5h7vujrKd9H-eHg-A2N6-vNzfyUJfMONhhnXAs9h5I8yIHUSWpO5DqV6kh7n_Yd9Z4fAFYGXzJtBbKb1qzdxDV8rHNlhMUjRAH28IwarvKkkQrZHa2-1qh2E4pbHCemhVaiaOF4tzIn3tBULzBqYYRqnJV96KNNMPit5R2bVReLVF8QC8onk7G8_l0Gd6G0_l0fhvNRmiP4pvZeBlFkyj8NFuEiyhazo8j9Lc8YDKeRFE4X8xm4XS5mC4n4QgBZUaq71UjXPbDx3-VFX8q?type=png)](https://mermaid.live/edit#pako:eNqtVktv4yAQ_isW5zTaJHaS-trVXvahqqu9rCJZBCYJWwMW4LbZNP998aMOjrHTasMJZj5gHh_DHBCRFFCMQH1meKswX4nAjl8alHamwaFaFGPNtkyYgNHAHfdfTwhtFBPbIACOWeoRC6L2mQGaZFjrZ6loF6NAg2n0iZGPIC6iNAiTYHPCUWzAMA4FkgNfg0qIAlxc7YcNa_OMdrRvphApNkxxbJgU5-Y651eovhtah3S8qa_KxekUf4Rzm7JEYA4dDabUxkx7ri4midwka6bMrrNvC4KCcjggZQpYBBQwMewJ6gweV8IhTfJgQboj8HPJ5U8tLd2wqi9dlbIHnatOURxK4nkOG5MdYwfNDLq594a6IKfMFYHE7LMhNaNX8-E-xUI708uhtiLYggowl7nocs0wkzq2G3gxNueaKJYVHNWeDe9hXS1_gh0jTdSbC0pKMcM6CiGNK3uzPbOuJjinzBYW6DhcajOsitc0zDNfXFL2CDoh7eD0sP8KCbyTnFtDdXt1OY11QG1hMNCytN9DNzx-FeGmJ3D_6eW3IqjO9KMFweN5kSe8Ts8fW72x0V7XjwdIy1KtdyzTHtH7n99Gpql8Lr3rVdJrVoof0rANI9h5xS3RuymngLCMFRzxRv6kPqvWb_WitemPlmIdWM5h7vujrKd9H-eHg-A2N6-vNzfyUJfMONhhnXAs9h5I8yIHUSWpO5DqV6kh7n_Yd9Z4fAFYGXzJtBbKb1qzdxDV8rHNlhMUjRAH28IwarvKkkQrZHa2-1qh2E4pbHCemhVaiaOF4tzIn3tBULzBqYYRqnJV96KNNMPit5R2bVReLVF8QC8onk7G8_l0Gd6G0_l0fhvNRmiP4pvZeBlFkyj8NFuEiyhazo8j9Lc8YDKeRFE4X8xm4XS5mC4n4QgBZUaq71UjXPbDx3-VFX8q)

#### 📌 Project structure
```
travel_app
├─ app
│  ├─ assets
│  ├─ channels
│  ├─ controllers
│  │  ├─ admin
│  │  ├─ concerns
|  |  └─ users
│  ├─ helpers
│  ├─ javascript
│  │  ├─ channels
│  │  ├─ controllers
│  │  │  ├─ admin
│  │  │  ├─ application
│  │  │  ├─ devise
│  │  │  └─ shared
│  │  ├─ fonts
│  │  ├─ images
│  │  ├─ packs
│  │  └─ styles
│  │     ├─ application
│  │     │  └─ views
│  │     └─ shared
│  │        └─ components
│  ├─ jobs
│  ├─ mailers
│  ├─ models
│  ├─ notifications
│  ├─ policies
│  ├─ services
│  └─ views
│     ├─ admin
│     ├─ comments
│     ├─ devise
│     ├─ home
│     ├─ layouts
│     ├─ notifications
│     ├─ plans
|     ├─ shared
│     └─ users
├─ bin
├─ config
│  ├─ initializers
│  ├─ locales
├─ db
```

[Ruby]: <https://www.ruby-lang.org/en/>
[Ruby on Rails]: <https://rubyonrails.org/>
[PostgreSQL]: <https://www.postgresql.org/>
[Bootstrap]: <https://getbootstrap.com/docs/5.3/getting-started/introduction/>
[StimulusJs]: <https://stimulus.hotwired.dev/>
[Redis]: <https://redis.io/>
[Cloudinary]: <https://cloudinary.com/>
