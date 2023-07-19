# Travel GO
Travel GO is is an application to share travel plans online.

## Features
- User can register/update account (email confirm).
- User can create/update travel plans and share with everyone on the system
- User can create/update comments on other users' travel plans.
- User can like/dislike other users' travel plans/comments.
- User can follow/unfollow other users.
- User can receive notifications when a relevant event occurs through real-time notifications.
- Admin can active/deactive employees account.

## General Information
- [Ruby]: (v3.1.2) - A dynamic, open source programming language.
- [Ruby on Rails]: (v6.1.7.3) - A full-stack framework, ships with all the tools needed.
- [PostgreSQL] (v1.1) - A powerful, open source object-relational database system.
- [Bootstrap] (v5.2.3) - The most popular CSS Framework for developing responsive and mobile-first websites.
- [StimulusJS] (v3.2.1) - A modest JavaScript framework for the HTML you already have.
- [Redis] (v4.0) - The open source, in-memory data store used by millions of developers as a database, cache, streaming engine, and message broker.
- [Cloudinary] (v1.26.0) - Streamline media management and improve user experience by automatically delivering images and videos, enhanced and optimized for every user.
- [jQuery] (v3.7.0) - A fast, small, and feature-rich JavaScript library. It makes things like HTML document traversal and manipulation, event handling, animation, and Ajax much simpler with an easy-to-use API that works across a multitude of browsers.

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
[![](https://mermaid.ink/img/pako:eNqtVtuO2jAQ_ZXIzyxaIATIa6u-9KLVVn2pkCITD-BubEe2s7uU5d_rXAgOcQKo5MmZOR7PnDm-7FEsCKAQgfxM8UZituSe-X4pkMoaevvyJ_9WdEO59ijx7O_p6wmhtKR843nAME0cZh7LXaqBRClW6k1I0sZIUKBrf6TFC_CLKAVcR1ifcARr0JRBjmTAViCjWALOl3bD-r1ZSlreYyqx4GsqGdZU8PN0rfglqmuFRpBWNdVSGT9FcTOcmZZFHDNoeTAhhjPlWDofRGIdrajU29a8DXAC0tKAEAlg7hHAsaavUHXwsOSWaKJnA1Itg1tLtn4qa1GGcX1pu6QJdO46sdjXxPMe1ilbyfam6bV776Q6F6fIZAyR3qV9bkruVsNTgrmyhpepNibYgPQwExlva01TnVi5a3jXpucqljTNNaocE65RXWV_hS2Na9brBQpJUU1bDi60bTvmnppSI5wRag4WaBVceFMs893UrzMXLwl9ARXFTXI61H-HBn4SjJlEVfPvchsrQs3BoKGRaXeFNj1uV8x0B3H_WeW3nFRreOuB4Kg87xNeJeebrZpYe-9bxzMkxVGttjRVDtP1228tkkS8FdV1Osk9T4ofQtM1jbG1ixumqyUnIaYpzTXiZP7kPjutj-dFY9IfJfjKM5rDzHVHmUq7Ls6bSbAfNx8fDw9iXx2ZobfFKmKY7xyQekf2ogpRtyDlrVJB7PuwK9ZweAHYFJsduT9mc945tKShgro5OUL6OWkEcnNSz70JdV0Xmno-QdEAMTCPLErMu7eQ-RLprXkfLlFohgTWOEv0Ei35wUBxpsXPHY9RuMaJggEq1VS9lmtrivlvIcy_lln5i8I9ekdh4A9H09nkcTyfBr4_nYwGaIdC3x8G85kfTINgNhv7wegwQH-L-Y_DxWI0n40n48liEfiT2XyAgFAt5PfypV482A__AHPTtsw?type=png)](https://mermaid.live/edit#pako:eNqtVtuO2jAQ_ZXIzyxaIATIa6u-9KLVVn2pkCITD-BubEe2s7uU5d_rXAgOcQKo5MmZOR7PnDm-7FEsCKAQgfxM8UZituSe-X4pkMoaevvyJ_9WdEO59ijx7O_p6wmhtKR843nAME0cZh7LXaqBRClW6k1I0sZIUKBrf6TFC_CLKAVcR1ifcARr0JRBjmTAViCjWALOl3bD-r1ZSlreYyqx4GsqGdZU8PN0rfglqmuFRpBWNdVSGT9FcTOcmZZFHDNoeTAhhjPlWDofRGIdrajU29a8DXAC0tKAEAlg7hHAsaavUHXwsOSWaKJnA1Itg1tLtn4qa1GGcX1pu6QJdO46sdjXxPMe1ilbyfam6bV776Q6F6fIZAyR3qV9bkruVsNTgrmyhpepNibYgPQwExlva01TnVi5a3jXpucqljTNNaocE65RXWV_hS2Na9brBQpJUU1bDi60bTvmnppSI5wRag4WaBVceFMs893UrzMXLwl9ARXFTXI61H-HBn4SjJlEVfPvchsrQs3BoKGRaXeFNj1uV8x0B3H_WeW3nFRreOuB4Kg87xNeJeebrZpYe-9bxzMkxVGttjRVDtP1228tkkS8FdV1Osk9T4ofQtM1jbG1ixumqyUnIaYpzTXiZP7kPjutj-dFY9IfJfjKM5rDzHVHmUq7Ls6bSbAfNx8fDw9iXx2ZobfFKmKY7xyQekf2ogpRtyDlrVJB7PuwK9ZweAHYFJsduT9mc945tKShgro5OUL6OWkEcnNSz70JdV0Xmno-QdEAMTCPLErMu7eQ-RLprXkfLlFohgTWOEv0Ei35wUBxpsXPHY9RuMaJggEq1VS9lmtrivlvIcy_lln5i8I9ekdh4A9H09nkcTyfBr4_nYwGaIdC3x8G85kfTINgNhv7wegwQH-L-Y_DxWI0n40n48liEfiT2XyAgFAt5PfypV482A__AHPTtsw)

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
│  │  │  ├─ users
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
[jQuery]: <https://jquery.com/>
