using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace MigrationsAssignment.Migrations
{
    /// <inheritdoc />
    public partial class DropFinalGradeInt : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "FinalGrade",
                table: "Enrollments");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<int>(
                name: "FinalGrade",
                table: "Enrollments",
                type: "INTEGER",
                nullable: true);
        }
    }
}
