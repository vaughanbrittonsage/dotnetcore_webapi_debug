using System;
using Xunit;
using FluentAssertions;

namespace api.unit.tests
{
    public class UnitTest1
    {
        [Fact]
        public void Test1()
        {
            var expected = 10;
            var actual = 2 * 5;

            actual.Should().Be(expected);
        }
    }
}
