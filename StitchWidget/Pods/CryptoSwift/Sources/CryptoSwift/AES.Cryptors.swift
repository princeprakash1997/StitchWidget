//
//  CryptoSwift
//
//  Copyright (C) 2014-2025 Marcin Krzyżanowski <marcin@krzyzanowskim.com>
//  This software is provided 'as-is', without any express or implied warranty.
//
//  In no event will the authors be held liable for any damages arising from the use of this software.
//
//  Permission is granted to anyone to use this software for any purpose,including commercial applications, and to alter it and redistribute it freely, subject to the following restrictions:
//
//  - The origin of this software must not be misrepresented; you must not claim that you wrote the original software. If you use this software in a product, an acknowledgment in the product documentation is required.
//  - Altered source versions must be plainly marked as such, and must not be misrepresented as being the original software.
//  - This notice may not be removed or altered from any source or binary distribution.
//

// MARK: Cryptors

extension AES: Cryptors {
  @inlinable
  public func makeEncryptor() throws -> Cryptor & Updatable {
    let blockSize = blockMode.customBlockSize ?? AES.blockSize
    let worker = try blockMode.worker(blockSize: blockSize, cipherOperation: encrypt, encryptionOperation: encrypt)
    if worker is StreamModeWorker {
      return try StreamEncryptor(blockSize: blockSize, padding: padding, worker)
    }
    return try BlockEncryptor(blockSize: blockSize, padding: padding, worker)
  }

  @inlinable
  public func makeDecryptor() throws -> Cryptor & Updatable {
    let blockSize = blockMode.customBlockSize ?? AES.blockSize
    let cipherOperation: CipherOperationOnBlock = blockMode.options.contains(.useEncryptToDecrypt) == true ? encrypt : decrypt
    let worker = try blockMode.worker(blockSize: blockSize, cipherOperation: cipherOperation, encryptionOperation: encrypt)
    if worker is StreamModeWorker {
      return try StreamDecryptor(blockSize: blockSize, padding: padding, worker)
    }
    return try BlockDecryptor(blockSize: blockSize, padding: padding, worker)
  }
}
