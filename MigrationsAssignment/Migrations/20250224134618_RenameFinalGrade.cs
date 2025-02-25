using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace MigrationsAssignment.Migrations
{
    /// <inheritdoc />
    public partial class RenameFinalGrade : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.RenameColumn(
                name: "FinalGradeDouble",
                table: "Enrollments",
                newName: "FinalGrade");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.RenameColumn(
                name: "FinalGrade",
                table: "Enrollments",
                newName: "FinalGradeDouble");
        }
    }
}
