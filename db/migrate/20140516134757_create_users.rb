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
      t.belongs_to :users
      t.belongs_to :deck
      t.timestamps
    end

    create_table :cards do |t|
      t.string :question, :answer
      t.belongs_to :deck
      t.timestamps
    end

    create_table :guesses do |t|
      t.string :user_input
      t.integer :correctness
      t.belongs_to :round
      t.belongs_to :card
      t.timestamps
    end
  end
end

