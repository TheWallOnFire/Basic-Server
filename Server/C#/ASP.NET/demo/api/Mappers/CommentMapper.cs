using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using api.Dtos.Comment;
using api.Models;
using Microsoft.CodeAnalysis.CSharp.Syntax;

namespace api.Mappers
{
    public static class CommentMapper
    {
        public static CommentDtos ToCommentDto(this Comments commentModel)
        {
            return new CommentDtos
            {
                Id = commentModel.Id,
                Title = commentModel.Title,
                Content = commentModel.Title,
                CreatedOn = commentModel.CreatedOn,
                StockId = commentModel.StockId
            };
        }
    }
}