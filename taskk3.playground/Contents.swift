import UIKit

enum ChessPieceColor {
    case white
    case black
}

enum ChessPieceType {
    case king
    case queen
    case rook
    case bishop
    case knight
    case pawn
}

struct ChessPiece {
    let type: ChessPieceType
    let color: ChessPieceColor
    var position: String
}

enum ChessBoard {
    static var pieces: [ChessPiece] = [
        ChessPiece(type: .king, color: .white, position: "e1"),
        ChessPiece(type: .queen, color: .white, position: "d1"),
        ChessPiece(type: .rook, color: .white, position: "a1"),
        ChessPiece(type: .rook, color: .white, position: "h1"),
        ChessPiece(type: .bishop, color: .white, position: "c1"),
        ChessPiece(type: .bishop, color: .white, position: "f1"),
        ChessPiece(type: .knight, color: .white, position: "b1"),
        ChessPiece(type: .knight, color: .white, position: "g1"),
        ChessPiece(type: .pawn, color: .white, position: "a2"),
        ChessPiece(type: .pawn, color: .white, position: "b2"),
        ChessPiece(type: .pawn, color: .white, position: "c2"),
        ChessPiece(type: .pawn, color: .white, position: "d2"),
        ChessPiece(type: .pawn, color: .white, position: "e2"),
        ChessPiece(type: .pawn, color: .white, position: "f2"),
        ChessPiece(type: .pawn, color: .white, position: "g2"),
        ChessPiece(type: .pawn, color: .white, position: "h2"),
        ChessPiece(type: .king, color: .black, position: "e8"),
        ChessPiece(type: .queen, color: .black, position: "d8"),
        ChessPiece(type: .rook, color: .black, position: "a8"),
        ChessPiece(type: .rook, color: .black, position: "h8"),
        ChessPiece(type: .bishop, color: .black, position: "c8"),
        ChessPiece(type: .bishop, color: .black, position: "f8"),
        ChessPiece(type: .knight, color: .black, position: "b8"),
        ChessPiece(type: .knight, color: .black, position: "g8"),
        ChessPiece(type: .pawn, color: .black, position: "a7"),
        ChessPiece(type: .pawn, color: .black, position: "b7"),
        ChessPiece(type: .pawn, color: .black, position: "c7"),
        ChessPiece(type: .pawn, color: .black, position: "d7"),
        ChessPiece(type: .pawn, color: .black, position: "e7"),
        ChessPiece(type: .pawn, color: .black, position: "f7"),
        ChessPiece(type: .pawn, color: .black, position: "g7"),
        ChessPiece(type: .pawn, color: .black, position: "h7")
    ]
}


for piece in ChessBoard.pieces {
    print("Piece: \(piece.type), Color: \(piece.color), Position: \(piece.position)")
}

func printChessBoard(with pieces: [ChessPiece]) {
    var board = [[String]](repeating: [String](repeating: "", count: 8), count: 8)
    
    for i in 0..<8 {
        for j in 0..<8 {
            if (i + j) % 2 == 0 {
                board[i][j] = "⬜️"
            } else {
                board[i][j] = "⬛️"
            }
        }
    }
    
    for piece in pieces {
        let row = 8 - Int(String(piece.position.last!))!
        let column = Int(piece.position.first!.asciiValue!) - Int(Character("a").asciiValue!)
        let emoji: String
        
        switch piece.type {
            case .king:
                emoji = piece.color == .white ? "♔" : "♚"
            case .queen:
                emoji = piece.color == .white ? "♕" : "♛"
            case .rook:
                emoji = piece.color == .white ? "♖" : "♜"
            case .bishop:
                emoji = piece.color == .white ? "♗" : "♝"
            case .knight:
                emoji = piece.color == .white ? "♘" : "♞"
            case .pawn:
                emoji = piece.color == .white ? "♙" : "♟"
        }
        
        board[row][column] = emoji
    }
    
    for i in 0..<8 {
        for j in 0..<8 {
            print(board[i][j], terminator: " ")
        }
        print("")
    }
}

printChessBoard(with: ChessBoard.pieces)
