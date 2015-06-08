class Error
  NO_ERROR = 0
  PARTIAL_ERROR = 10
  INSUFFICIENT_PARAMETER = 110
  INVALID_PARAMETER = 111
  NOT_FOUND_DATA = 201
  ALREADY_EXISTS_DATA = 202
  INVALID_TOKEN = 301
  NOT_ALLOWED = 302
  TOO_MANY_TRIAL = 303
  EXPIRED = 304
  DB_ERROR = 400

  def self.create(code, object)
    case code
      when NO_ERROR
        return {
          code: 0,
          guide: "No error"
        }
      when PARTIAL_ERROR
        return {
          code: 10,
          guide: "Partial error"
        }
      when INSUFFICIENT_PARAMETER
        return {
          code: 110,
          object: object,
          guide: "Insufficient Parameter : " + object
        }
      when INVALID_PARAMETER
        return {
          code: 111,
          object: object,
          guide: "Invalid Parameter : " + object
        }
      when NOT_FOUND_DATA
        return {
          code: 201,
          object: object,
          guide: "Not Founds Data : " + object
        }
      when ALREADY_EXISTS_DATA
        return {
          code: 202,
          object: object,
          guide: "Already Exists Data : " + object
        }
      when INVALID_TOKEN
        return {
          code: 301,
          guide: "Invalid Authentication Token"
        }
      when NOT_ALLOWED
        return {
          code: 302,
          object: object,
          guide: "Not Allowed to Request : " + object
        }
      when TOO_MANY_TRIAL
        return {
          code: 303,
          object: object,
          guide: "Too Many Trials : " + object
        }
      when EXPIRED
        return {
          code: 304,
          object: object,
          guide: "Expired : " + object
        }
      when DB_ERROR
        return {
          code: 400,
          object: object,
          guide: "DB Error to Save " + object
        }
    end
  end
end
