class Articulo < ApplicationRecord
	has_many :comentarios
	validates :titular, presence: true, length: {minimum: 5}

end
