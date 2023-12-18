# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Product.delete_all
Product.create!(title: 'Sense and Sensibility',
  description:
    %{<p>
      <em>Sense and Sensibility</em> is an 1811 novel by the English author Jane Austen.
      The novel follows the three Dashwood sisters and their widowed mother as they are forced to leave
      the family estate at Norland Park and move to Barton Cottage, a modest home on the property of 
      distant relative Sir John Middleton. There Elinor and Marianne experience love, romance, and heartbreak.
      </p>},
  image_url: 'sense_and_sensibility.jpg',
  price: 19.95)

Product.create!(title: 'Pride and Prejudice',
  description:
    %{<p>
      <em>Pride and Prejudice</em> is an 1813 novel by English author Jane Austen.
      The novel follows Elizabeth Bennet, who learns about the repercussions of hasty judgments and comes to appreciate the difference between superficial goodness and actual goodness.
      Mr Bennet, owner of the Longbourn estate in Hertfordshire, has five daughters, but his property is entailed and can only be passed to a male heir.
      Thus, it is imperative that at least one of the daughters marry well to support the others.
      </p>},
  image_url: 'pride_and_prejudice.jpg',
  price: 24.95)

