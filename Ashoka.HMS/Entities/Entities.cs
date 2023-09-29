using Microsoft.AspNetCore.DataProtection.KeyManagement;
using System.Data;
using System.Reflection;
using System.Runtime.Intrinsics.Arm;
using System.Security.Cryptography;
using System.Security.Cryptography.X509Certificates;

namespace Ashoka.HMS.Entities
{
    public class Student
    {
        public int StudentId { get; set; }
        public string EmailId { get; set; }
        public string Gender { get; set; }
        public string Name { get; set; }
    }

    public class StudentResidentAllocation
    {
        public int StudentResidentId  { get; set; }
        public int StudentId { get; set; }
        public int RoomId { get; set; }
        public int BedId  { get; set; }
        
    }

    public class StudentRoomAllotment
    {
        public int? RoomMateId { get; set; }
        public int StudentId { get; set; }
        public string? ResHallName { get; set; }
        public int? RoomNo { get; set; }
        public string? Bed1 { get; set; }
        public string? Bed2 { get; set; }

    }
    public class StudentResHallPref
        {
            public int StudentId { get; set; }
            public string? Gender { get; set; }
            public int? RoomMateId { get; set; }
            public string? EmailId { get; set; }
            public int? RoomPrefType { get; set; }
        }

    public class ResHallMaster
    {
        public int ResHallId { get; set; }
        public string ResHallName { get; set; }
        public string? OccupantType { get; set; }
    }
    
    public class RoomMaster
    {
        public int RoomId { get; set; }
        public int ResHallId { get; set; }
        public int RoomNo { get; set; }
        public int Shared { get; set; }
        public int RoomType { get; set; }
        public int IsOccupied { get; set; }
    }

    public class BedMaster
    {
        public int BedId { get; set; }
        public int RoomId { get; set; }
        public string? BedType { get; set; }
        public int IsOccupied { get; set; }
    }
  
}
