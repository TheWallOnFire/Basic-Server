using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;

namespace api.Interfaces
{
    public interface ICommentRepository
    {
        Task<List<CommentAttribute>> GetAllAsync();
    }
}