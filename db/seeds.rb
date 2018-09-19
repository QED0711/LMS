

u1 = User.create(name: "Quinn", email: "qdizon@email.com", password: "123", authorization: 0)
u2 = User.create(name: "Betsy", email: "bdizon@email.com", password: "123", authorization: 1)
u3 = User.create(name: "Rafe", email: "rdizon@email.com", password: "123", authorization: 2)

c1 = Course.create(title: "MUSC 140 Fall 2018")
c2 = Course.create(title: "Intro to Music Composition")

cat1 = Category.create(title: "Music Theory")
cat2 = Category.create(title: "Music Composition")

l1 = Lesson.create(title: "Intervals", published: false)
l2 = Lesson.create(title: "Melodic Composition", published: false)

un1 = Unit.create(title: "Fundamentals")
un2 = Unit.create(title: "Elements of Composition")

c1.users << u1
c1.units << un1
c1.users << u3
c2.units << un2

c2.users << u2

cat1.lessons << l1
cat2.lessons << l2

un1.lessons << l1
un2.lessons << l2