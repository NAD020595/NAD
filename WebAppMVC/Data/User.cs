using System;
using System.Collections.Generic;

namespace WebAppMVC.Data;

public partial class User
{
    public Guid Id { get; set; }

    public string Email { get; set; } = null!;

    public string FirstName { get; set; } = null!;

    public string LastName { get; set; } = null!;

    public string? Password { get; set; }

    public Guid RoleId { get; set; }

    public int Status { get; set; }

    public DateTime? CreateDateTime { get; set; }

    public Guid? Creator { get; set; }

    public DateTime? LastChangeDateTime { get; set; }

    public Guid? LastChangeUser { get; set; }

    public virtual Role Role { get; set; } = null!;
}
