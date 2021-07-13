class User < ApplicationRecord
    has_secure_password
    paginates_per 2
end