# == Schema Information
#
# Table name: moves
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Move < ApplicationRecord
	validates :name, length: { maximum: 255 }, uniqueness: { message: "Name must be unique, '%{value}' already taken" }

	has_many :poke_moves,
		foreign_key: :move_id,
		class_name: :PokeMove,
		dependent: :destroy

	has_many :pokemons,
		through: :poke_moves,
		source: :pokemon
end
