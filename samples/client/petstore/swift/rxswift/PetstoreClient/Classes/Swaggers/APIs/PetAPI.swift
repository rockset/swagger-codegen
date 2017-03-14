//
// PetAPI.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Alamofire
import RxSwift



public class PetAPI: APIBase {
    /**
     Add a new pet to the store
     
     - parameter body: (body) Pet object that needs to be added to the store (optional)
     - parameter completion: completion handler to receive the data and the error objects
     */
    public class func addPet(body body: Pet? = nil, completion: ((error: ErrorType?) -> Void)) {
        addPetWithRequestBuilder(body: body).execute { (response, error) -> Void in
            completion(error: error);
        }
    }

    /**
     Add a new pet to the store
     
     - parameter body: (body) Pet object that needs to be added to the store (optional)
     - returns: Observable<Void>
     */
    public class func addPet(body body: Pet? = nil) -> Observable<Void> {
        return Observable.create { observer -> Disposable in
            addPet(body: body) { error in
                if let error = error {
                    observer.on(.Error(error as ErrorType))
                } else {
                    observer.on(.Next())
                }
                observer.on(.Completed)
            }
            return NopDisposable.instance
        }
    }

    /**
     Add a new pet to the store
     - POST /pet
     - 
     - OAuth:
       - type: oauth2
       - name: petstore_auth
     
     - parameter body: (body) Pet object that needs to be added to the store (optional)

     - returns: RequestBuilder<Void> 
     */
    public class func addPetWithRequestBuilder(body body: Pet? = nil) -> RequestBuilder<Void> {
        let path = "/pet"
        let URLString = PetstoreClientAPI.basePath + path
        let parameters = body?.encodeToJSON() as? [String:AnyObject]
 
        let convertedParameters = APIHelper.convertBoolToString(parameters)
 
        let requestBuilder: RequestBuilder<Void>.Type = PetstoreClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "POST", URLString: URLString, parameters: convertedParameters, isBody: true)
    }

    /**
     Deletes a pet
     
     - parameter petId: (path) Pet id to delete 
     - parameter apiKey: (header)  (optional)
     - parameter completion: completion handler to receive the data and the error objects
     */
    public class func deletePet(petId petId: Int64, apiKey: String? = nil, completion: ((error: ErrorType?) -> Void)) {
        deletePetWithRequestBuilder(petId: petId, apiKey: apiKey).execute { (response, error) -> Void in
            completion(error: error);
        }
    }

    /**
     Deletes a pet
     
     - parameter petId: (path) Pet id to delete 
     - parameter apiKey: (header)  (optional)
     - returns: Observable<Void>
     */
    public class func deletePet(petId petId: Int64, apiKey: String? = nil) -> Observable<Void> {
        return Observable.create { observer -> Disposable in
            deletePet(petId: petId, apiKey: apiKey) { error in
                if let error = error {
                    observer.on(.Error(error as ErrorType))
                } else {
                    observer.on(.Next())
                }
                observer.on(.Completed)
            }
            return NopDisposable.instance
        }
    }

    /**
     Deletes a pet
     - DELETE /pet/{petId}
     - 
     - OAuth:
       - type: oauth2
       - name: petstore_auth
     
     - parameter petId: (path) Pet id to delete 
     - parameter apiKey: (header)  (optional)

     - returns: RequestBuilder<Void> 
     */
    public class func deletePetWithRequestBuilder(petId petId: Int64, apiKey: String? = nil) -> RequestBuilder<Void> {
        var path = "/pet/{petId}"
        path = path.stringByReplacingOccurrencesOfString("{petId}", withString: "\(petId)", options: .LiteralSearch, range: nil)
        let URLString = PetstoreClientAPI.basePath + path

        let nillableParameters: [String:AnyObject?] = [:]
 
        let parameters = APIHelper.rejectNil(nillableParameters)
 
        let convertedParameters = APIHelper.convertBoolToString(parameters)
        let nillableHeaders: [String: AnyObject?] = [
            "api_key": apiKey
        ]
        let headerParameters = APIHelper.rejectNilHeaders(nillableHeaders)
 
        let requestBuilder: RequestBuilder<Void>.Type = PetstoreClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "DELETE", URLString: URLString, parameters: convertedParameters, isBody: true, headers: headerParameters)
    }

    /**
     Finds Pets by status
     
     - parameter status: (query) Status values that need to be considered for filter (optional, default to available)
     - parameter completion: completion handler to receive the data and the error objects
     */
    public class func findPetsByStatus(status status: [String]? = nil, completion: ((data: [Pet]?, error: ErrorType?) -> Void)) {
        findPetsByStatusWithRequestBuilder(status: status).execute { (response, error) -> Void in
            completion(data: response?.body, error: error);
        }
    }

    /**
     Finds Pets by status
     
     - parameter status: (query) Status values that need to be considered for filter (optional, default to available)
     - returns: Observable<[Pet]>
     */
    public class func findPetsByStatus(status status: [String]? = nil) -> Observable<[Pet]> {
        return Observable.create { observer -> Disposable in
            findPetsByStatus(status: status) { data, error in
                if let error = error {
                    observer.on(.Error(error as ErrorType))
                } else {
                    observer.on(.Next(data!))
                }
                observer.on(.Completed)
            }
            return NopDisposable.instance
        }
    }

    /**
     Finds Pets by status
     - GET /pet/findByStatus
     - Multiple status values can be provided with comma separated strings
     - OAuth:
       - type: oauth2
       - name: petstore_auth
     - examples: [{contentType=application/json, example={
  "name" : "Puma",
  "type" : "Dog",
  "color" : "Black",
  "gender" : "Female",
  "breed" : "Mixed"
}}]
     
     - parameter status: (query) Status values that need to be considered for filter (optional, default to available)

     - returns: RequestBuilder<[Pet]> 
     */
    public class func findPetsByStatusWithRequestBuilder(status status: [String]? = nil) -> RequestBuilder<[Pet]> {
        let path = "/pet/findByStatus"
        let URLString = PetstoreClientAPI.basePath + path

        let nillableParameters: [String:AnyObject?] = [
            "status": status
        ]
 
        let parameters = APIHelper.rejectNil(nillableParameters)
 
        let convertedParameters = APIHelper.convertBoolToString(parameters)
 
        let requestBuilder: RequestBuilder<[Pet]>.Type = PetstoreClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: URLString, parameters: convertedParameters, isBody: false)
    }

    /**
     Finds Pets by tags
     
     - parameter tags: (query) Tags to filter by (optional)
     - parameter completion: completion handler to receive the data and the error objects
     */
    public class func findPetsByTags(tags tags: [String]? = nil, completion: ((data: [Pet]?, error: ErrorType?) -> Void)) {
        findPetsByTagsWithRequestBuilder(tags: tags).execute { (response, error) -> Void in
            completion(data: response?.body, error: error);
        }
    }

    /**
     Finds Pets by tags
     
     - parameter tags: (query) Tags to filter by (optional)
     - returns: Observable<[Pet]>
     */
    public class func findPetsByTags(tags tags: [String]? = nil) -> Observable<[Pet]> {
        return Observable.create { observer -> Disposable in
            findPetsByTags(tags: tags) { data, error in
                if let error = error {
                    observer.on(.Error(error as ErrorType))
                } else {
                    observer.on(.Next(data!))
                }
                observer.on(.Completed)
            }
            return NopDisposable.instance
        }
    }

    /**
     Finds Pets by tags
     - GET /pet/findByTags
     - Multiple tags can be provided with comma separated strings. Use tag1, tag2, tag3 for testing.
     - OAuth:
       - type: oauth2
       - name: petstore_auth
     - examples: [{contentType=application/json, example=[ {
  "photoUrls" : [ "aeiou" ],
  "name" : "doggie",
  "id" : 123456789,
  "category" : {
    "name" : "aeiou",
    "id" : 123456789
  },
  "tags" : [ {
    "name" : "aeiou",
    "id" : 123456789
  } ],
  "status" : "aeiou"
} ]}, {contentType=application/xml, example=<Pet>
  <id>123456789</id>
  <name>doggie</name>
  <photoUrls>
    <photoUrls>aeiou</photoUrls>
  </photoUrls>
  <tags>
  </tags>
  <status>aeiou</status>
</Pet>}]
     - examples: [{contentType=application/json, example=[ {
  "photoUrls" : [ "aeiou" ],
  "name" : "doggie",
  "id" : 123456789,
  "category" : {
    "name" : "aeiou",
    "id" : 123456789
  },
  "tags" : [ {
    "name" : "aeiou",
    "id" : 123456789
  } ],
  "status" : "aeiou"
} ]}, {contentType=application/xml, example=<Pet>
  <id>123456789</id>
  <name>doggie</name>
  <photoUrls>
    <photoUrls>aeiou</photoUrls>
  </photoUrls>
  <tags>
  </tags>
  <status>aeiou</status>
</Pet>}]
     
     - parameter tags: (query) Tags to filter by (optional)

     - returns: RequestBuilder<[Pet]> 
     */
    public class func findPetsByTagsWithRequestBuilder(tags tags: [String]? = nil) -> RequestBuilder<[Pet]> {
        let path = "/pet/findByTags"
        let URLString = PetstoreClientAPI.basePath + path

        let nillableParameters: [String:AnyObject?] = [
            "tags": tags
        ]
 
        let parameters = APIHelper.rejectNil(nillableParameters)
 
        let convertedParameters = APIHelper.convertBoolToString(parameters)
 
        let requestBuilder: RequestBuilder<[Pet]>.Type = PetstoreClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: URLString, parameters: convertedParameters, isBody: false)
    }

    /**
     Find pet by ID
     
     - parameter petId: (path) ID of pet that needs to be fetched 
     - parameter completion: completion handler to receive the data and the error objects
     */
    public class func getPetById(petId petId: Int64, completion: ((data: Pet?, error: ErrorType?) -> Void)) {
        getPetByIdWithRequestBuilder(petId: petId).execute { (response, error) -> Void in
            completion(data: response?.body, error: error);
        }
    }

    /**
     Find pet by ID
     
     - parameter petId: (path) ID of pet that needs to be fetched 
     - returns: Observable<Pet>
     */
    public class func getPetById(petId petId: Int64) -> Observable<Pet> {
        return Observable.create { observer -> Disposable in
            getPetById(petId: petId) { data, error in
                if let error = error {
                    observer.on(.Error(error as ErrorType))
                } else {
                    observer.on(.Next(data!))
                }
                observer.on(.Completed)
            }
            return NopDisposable.instance
        }
    }

    /**
     Find pet by ID
     - GET /pet/{petId}
     - Returns a pet when ID < 10.  ID > 10 or nonintegers will simulate API error conditions
     - OAuth:
       - type: oauth2
       - name: petstore_auth
     - API Key:
       - type: apiKey api_key 
       - name: api_key
     - examples: [{contentType=application/json, example={
  "photoUrls" : [ "aeiou" ],
  "name" : "doggie",
  "id" : 123456789,
  "category" : {
    "name" : "aeiou",
    "id" : 123456789
  },
  "tags" : [ {
    "name" : "aeiou",
    "id" : 123456789
  } ],
  "status" : "aeiou"
}}, {contentType=application/xml, example=<Pet>
  <id>123456789</id>
  <name>doggie</name>
  <photoUrls>
    <photoUrls>aeiou</photoUrls>
  </photoUrls>
  <tags>
  </tags>
  <status>aeiou</status>
</Pet>}]
     - examples: [{contentType=application/json, example={
  "photoUrls" : [ "aeiou" ],
  "name" : "doggie",
  "id" : 123456789,
  "category" : {
    "name" : "aeiou",
    "id" : 123456789
  },
  "tags" : [ {
    "name" : "aeiou",
    "id" : 123456789
  } ],
  "status" : "aeiou"
}}, {contentType=application/xml, example=<Pet>
  <id>123456789</id>
  <name>doggie</name>
  <photoUrls>
    <photoUrls>aeiou</photoUrls>
  </photoUrls>
  <tags>
  </tags>
  <status>aeiou</status>
</Pet>}]
     
     - parameter petId: (path) ID of pet that needs to be fetched 

     - returns: RequestBuilder<Pet> 
     */
    public class func getPetByIdWithRequestBuilder(petId petId: Int64) -> RequestBuilder<Pet> {
        var path = "/pet/{petId}"
        path = path.stringByReplacingOccurrencesOfString("{petId}", withString: "\(petId)", options: .LiteralSearch, range: nil)
        let URLString = PetstoreClientAPI.basePath + path

        let nillableParameters: [String:AnyObject?] = [:]
 
        let parameters = APIHelper.rejectNil(nillableParameters)
 
        let convertedParameters = APIHelper.convertBoolToString(parameters)
 
        let requestBuilder: RequestBuilder<Pet>.Type = PetstoreClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: URLString, parameters: convertedParameters, isBody: true)
    }

    /**
     Update an existing pet
     
     - parameter body: (body) Pet object that needs to be added to the store (optional)
     - parameter completion: completion handler to receive the data and the error objects
     */
    public class func updatePet(body body: Pet? = nil, completion: ((error: ErrorType?) -> Void)) {
        updatePetWithRequestBuilder(body: body).execute { (response, error) -> Void in
            completion(error: error);
        }
    }

    /**
     Update an existing pet
     
     - parameter body: (body) Pet object that needs to be added to the store (optional)
     - returns: Observable<Void>
     */
    public class func updatePet(body body: Pet? = nil) -> Observable<Void> {
        return Observable.create { observer -> Disposable in
            updatePet(body: body) { error in
                if let error = error {
                    observer.on(.Error(error as ErrorType))
                } else {
                    observer.on(.Next())
                }
                observer.on(.Completed)
            }
            return NopDisposable.instance
        }
    }

    /**
     Update an existing pet
     - PUT /pet
     - 
     - OAuth:
       - type: oauth2
       - name: petstore_auth
     
     - parameter body: (body) Pet object that needs to be added to the store (optional)

     - returns: RequestBuilder<Void> 
     */
    public class func updatePetWithRequestBuilder(body body: Pet? = nil) -> RequestBuilder<Void> {
        let path = "/pet"
        let URLString = PetstoreClientAPI.basePath + path
        let parameters = body?.encodeToJSON() as? [String:AnyObject]
 
        let convertedParameters = APIHelper.convertBoolToString(parameters)
 
        let requestBuilder: RequestBuilder<Void>.Type = PetstoreClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "PUT", URLString: URLString, parameters: convertedParameters, isBody: true)
    }

    /**
     Updates a pet in the store with form data
     
     - parameter petId: (path) ID of pet that needs to be updated 
     - parameter name: (form) Updated name of the pet (optional)
     - parameter status: (form) Updated status of the pet (optional)
     - parameter completion: completion handler to receive the data and the error objects
     */
    public class func updatePetWithForm(petId petId: String, name: String? = nil, status: String? = nil, completion: ((error: ErrorType?) -> Void)) {
        updatePetWithFormWithRequestBuilder(petId: petId, name: name, status: status).execute { (response, error) -> Void in
            completion(error: error);
        }
    }

    /**
     Updates a pet in the store with form data
     
     - parameter petId: (path) ID of pet that needs to be updated 
     - parameter name: (form) Updated name of the pet (optional)
     - parameter status: (form) Updated status of the pet (optional)
     - returns: Observable<Void>
     */
    public class func updatePetWithForm(petId petId: String, name: String? = nil, status: String? = nil) -> Observable<Void> {
        return Observable.create { observer -> Disposable in
            updatePetWithForm(petId: petId, name: name, status: status) { error in
                if let error = error {
                    observer.on(.Error(error as ErrorType))
                } else {
                    observer.on(.Next())
                }
                observer.on(.Completed)
            }
            return NopDisposable.instance
        }
    }

    /**
     Updates a pet in the store with form data
     - POST /pet/{petId}
     - 
     - OAuth:
       - type: oauth2
       - name: petstore_auth
     
     - parameter petId: (path) ID of pet that needs to be updated 
     - parameter name: (form) Updated name of the pet (optional)
     - parameter status: (form) Updated status of the pet (optional)

     - returns: RequestBuilder<Void> 
     */
    public class func updatePetWithFormWithRequestBuilder(petId petId: String, name: String? = nil, status: String? = nil) -> RequestBuilder<Void> {
        var path = "/pet/{petId}"
        path = path.stringByReplacingOccurrencesOfString("{petId}", withString: "\(petId)", options: .LiteralSearch, range: nil)
        let URLString = PetstoreClientAPI.basePath + path

        let nillableParameters: [String:AnyObject?] = [
            "name": name,
            "status": status
        ]
 
        let parameters = APIHelper.rejectNil(nillableParameters)
 
        let convertedParameters = APIHelper.convertBoolToString(parameters)
 
        let requestBuilder: RequestBuilder<Void>.Type = PetstoreClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "POST", URLString: URLString, parameters: convertedParameters, isBody: false)
    }

    /**
     uploads an image
     
     - parameter petId: (path) ID of pet to update 
     - parameter additionalMetadata: (form) Additional data to pass to server (optional)
     - parameter file: (form) file to upload (optional)
     - parameter completion: completion handler to receive the data and the error objects
     */
    public class func uploadFile(petId petId: Int64, additionalMetadata: String? = nil, file: NSURL? = nil, completion: ((error: ErrorType?) -> Void)) {
        uploadFileWithRequestBuilder(petId: petId, additionalMetadata: additionalMetadata, file: file).execute { (response, error) -> Void in
            completion(error: error);
        }
    }

    /**
     uploads an image
     
     - parameter petId: (path) ID of pet to update 
     - parameter additionalMetadata: (form) Additional data to pass to server (optional)
     - parameter file: (form) file to upload (optional)
     - returns: Observable<Void>
     */
    public class func uploadFile(petId petId: Int64, additionalMetadata: String? = nil, file: NSURL? = nil) -> Observable<Void> {
        return Observable.create { observer -> Disposable in
            uploadFile(petId: petId, additionalMetadata: additionalMetadata, file: file) { error in
                if let error = error {
                    observer.on(.Error(error as ErrorType))
                } else {
                    observer.on(.Next())
                }
                observer.on(.Completed)
            }
            return NopDisposable.instance
        }
    }

    /**
     uploads an image
     - POST /pet/{petId}/uploadImage
     - 
     - OAuth:
       - type: oauth2
       - name: petstore_auth
     
     - parameter petId: (path) ID of pet to update 
     - parameter additionalMetadata: (form) Additional data to pass to server (optional)
     - parameter file: (form) file to upload (optional)

     - returns: RequestBuilder<Void> 
     */
    public class func uploadFileWithRequestBuilder(petId petId: Int64, additionalMetadata: String? = nil, file: NSURL? = nil) -> RequestBuilder<Void> {
        var path = "/pet/{petId}/uploadImage"
        path = path.stringByReplacingOccurrencesOfString("{petId}", withString: "\(petId)", options: .LiteralSearch, range: nil)
        let URLString = PetstoreClientAPI.basePath + path

        let nillableParameters: [String:AnyObject?] = [
            "additionalMetadata": additionalMetadata,
            "file": file
        ]
 
        let parameters = APIHelper.rejectNil(nillableParameters)
 
        let convertedParameters = APIHelper.convertBoolToString(parameters)
 
        let requestBuilder: RequestBuilder<Void>.Type = PetstoreClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "POST", URLString: URLString, parameters: convertedParameters, isBody: false)
    }

}
