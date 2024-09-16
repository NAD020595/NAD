using System;
using System.Collections.Generic;

namespace WebAppMVC.Data;

public partial class Role
{
    public Guid Id { get; set; }

    public string Name { get; set; } = null!;

    public string Description { get; set; } = null!;

    public int Status { get; set; }

    public DateTime? CreateDateTime { get; set; }

    public Guid? Creator { get; set; }

    public DateTime? LastChangeDateTime { get; set; }

    public Guid? LastChangeUser { get; set; }

    public virtual ICollection<User> Users { get; set; } = new List<User>();
}
