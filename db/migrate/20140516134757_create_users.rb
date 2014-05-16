class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, :email, :password_hash
      t.timestamps
    end

    create_table :decks do |t|
      t.string :name
      t.timestamps
    end

    create_table :rounds do |t|
      t.integer :user_id
      t.integer :deck_id
      t.timestamps
    end

    create_table :cards do |t|
      t.string :question, :answer
      t.integer :deck_id
      t.timestamps
    end

    create_table :guesses do |t|
      t.string :user_input
      t.integer :correctness
      t.integer :round_id
      t.integer :card_id
      t.timestamps
    end
  end
end

