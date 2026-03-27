


import UIKit



enum PersistenceActionType{
    case add, remove
}


enum PersistenceManager {
    
    static let userDefaults = UserDefaults.standard
    
    enum Keys {
        static let favourites = "favorites"
    }
    
    static func updateFavorites(favorite: Follower, action: PersistenceActionType, completed: @escaping(GFError?) -> Void){
        retriveFavorites { result in
            switch result{
            case .success(let favorites):
                var updatedFavorites = favorites
                
                switch action {
                    
                case .add:
                    guard !updatedFavorites.contains(favorite) else {
                        completed(.alreadyInFavorites)
                        return
                    }
                    updatedFavorites.append(favorite)
                    
                case .remove:
                    updatedFavorites.removeAll { $0.login == favorite.login }
                }
                
                completed(saveFavorites(favorites: updatedFavorites))
                
                break
            case .failure(let error):
                completed(error)
            }
        }
    }
    
    static func retriveFavorites(completed: @escaping(Result<[Follower], GFError>) -> Void){
        guard let favoritesData = userDefaults.object(forKey: Keys.favourites) as? Data else {
            completed(.success([]))
            return
        }
        
        do {
            let decoder = JSONDecoder()
            let favorites = try decoder.decode([Follower].self, from: favoritesData)
            completed(.success(favorites))
        } catch {
            completed(.failure(.unableToFavorite))
        }
    }
    
    static func saveFavorites(favorites: [Follower]) -> GFError? {
        do {
            let encoder = JSONEncoder()
            let encodedFavorites = try encoder.encode(favorites)
            userDefaults.set(encodedFavorites, forKey: Keys.favourites)
            return nil
        }catch {
            return GFError.unableToFavorite
        }
    }
    
}
