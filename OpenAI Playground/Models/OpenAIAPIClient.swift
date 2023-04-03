//
//  APIClient.swift
//  OpenAI Playground
//
//  Created by Brennan Holzer on 3/31/23.
//

import Foundation
import Combine

let baseURL = "https://api.openai.com/v1"

enum OpenAIAPIClientError: Error {
    case invalidURL
    case noDataReceived
    case invalidServerResponse
}

struct ModelsResponse: Codable {
    let data: [ModelResponse]
    let object: String
}

struct ModelResponse: Codable {
    let id: String
    let object: String
    let owned_by: String
    let permission: [String]
}

struct ChatResponse: Codable {
    let id: String
    let object: String
    let created: Int
    let choices: [ChatChoiceResponse]
    let usage: ChatUsageResponse
}

struct ChatChoiceResponse: Codable {
    let index: Int
    let message: ChatMessageResponse
    let finish_reason: String
}

struct ChatMessageResponse: Codable {
    let role: String
    let content: String
}

struct ChatUsageResponse: Codable {
    let prompt_tokens: Int
    let completion_tokens: Int
    let total_tokens: Int
}

struct ChatRequestBody: Codable {
    var model: String = "gpt-3.5-turbo"
    var messages: [ChatMessageResponse] = []
    var temperature: Double = 0.7
    var top_p: Double = 1.0
    var n: Int = 1
    var stop: [String] = []
    var max_tokens: Int = 1024
    var presence_penalty: Double = 0.0
    var frequency_penatly: Double = 0.0
}



struct OpenAIAPIClient {
    let openaiApiKey: String
    
    func getModels() -> AnyPublisher<[ModelResponse], Error> {
        let endpoint: String = "/models"
        guard let url = URL(string: baseURL + endpoint) else {
            return Fail(error: OpenAIAPIClientError.invalidURL).eraseToAnyPublisher()
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("Bearer \(openaiApiKey)", forHTTPHeaderField: "Authorization")
        
        return URLSession.shared.dataTaskPublisher(for: request)
            .tryMap { data, response -> Data in
                guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                    throw OpenAIAPIClientError.invalidServerResponse
                }
                return data
            }
            .decode(type: ModelsResponse.self, decoder: JSONDecoder())
            .map(\.data)
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }

    func getChatCompletions(body: ChatRequestBody) -> AnyPublisher<[ChatChoiceResponse], Error> {
        let endpoint: String = "/chat/completions"
        guard let url = URL(string: baseURL + endpoint) else {
            return Fail(error: OpenAIAPIClientError.invalidURL).eraseToAnyPublisher()
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("Bearer \(openaiApiKey)", forHTTPHeaderField: "Authorization")

        do {
            let jsonData = try JSONEncoder().encode(body)
            request.httpBody = jsonData
        } catch {
            return Fail(error: error).eraseToAnyPublisher()
        }
        
        return URLSession.shared.dataTaskPublisher(for: request)
            .tryMap { data, response -> Data in
                guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                    throw OpenAIAPIClientError.invalidServerResponse
                }
                return data
            }
            .decode(type: ChatResponse.self, decoder: JSONDecoder())
            .map(\.choices)
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
//    func getChatCompletion(body: ChatRequestBody) -> AnyPublisher<ChatChoiceResponse, Error> {
//        getChatCompletions(body: body)[0]
//    }
}
