namespace :dev do
  task fake_users: :environment do
    User.destroy_all
    20.times do |i|
      User.create!(
        email: (User.count+1).to_s+".user@sample.com",
        password: "password",
        name: FFaker::Name.first_name,
        description: FFaker::Lorem.paragraph
        )
    end
    
    puts "create #{User.count} fake users"
    puts "Now you have #{User.count} users!"
  end

  task fake_articles: :environment do
    Article.destroy_all
    100.times do |i|
        user = User.all.sample
        state = ['publish', 'draft']
        user.articles.create!(
            title: FFaker::Book.title,
            content: FFaker::Book.description,
            state: state.sample,
            auth: 'all',
            category_ids: [Category.all.sample.id, Category.all.sample.id]
        )
    end
    puts "create #{Article.count} fake articles"
    puts "Now you have #{Article.count} articles!"
  end

  task fake_comments: :environment do
    Comment.destroy_all
    300.times do |i|
        user = User.all.sample
        article = Article.where(state: 'publish').sample
        Comment.create!(
            user: user,
            article: article,
            content: FFaker::Book.description
        )
    end
    puts "create #{Comment.count} fake comments"
    puts "Now you have #{Comment.count} comments!"
  end

  task fake_invitations: :environment do
    Invitation.destroy_all
    Friendship.destroy_all
    20.times do |i|
        user = User.all.sample
        user2 = User.all.sample
        Invitation.create!(
            inviter: user,
            invitee: user2,
            state: ['pending', 'accept'].sample
        )
    end
    puts "create #{Invitation.count} fake invitations"
    puts "Now you have #{Friendship.count} friendships!"
  end

  task fake_all: :environment do
    system "rails dev:fake_users"
    system "rails db:seed"
    system "rails dev:fake_articles"
    system "rails dev:fake_comments"
    system "rails dev:fake_invitations"
  end
end