use super::*;

////////////////////////////////////////////////
// Challenge 4
////////////////////////////////////////////////
struct Meal {
    main: Entree,
    side: Either<Soup, Salad>,
}

type Entree = String;
type Soup = String;
type Salad = String;

fn eat(meal: Meal) -> String {
    let main = meal.main;
    match meal.side {
        Either::Left(soup) => format!("Let's eat {:?} with a tasty cup of {:?} soup", main, soup),
        Either::Right(salad) => format!(
            "Let's eat {:?} with a refreshing bowl of {:?} salad",
            main, salad
        ),
    }
}

#[cfg(test)]
mod test_either {
    use super::*;
    #[test]
    fn test_poultry() {
        let meal = Meal {
            main: "chicken".to_owned(),
            side: Either::Left("French".to_owned()),
        };

        assert_eq!(
            eat(meal),
            r#"Let's eat "chicken" with a tasty cup of "French" soup"#
        );
    }

    #[test]
    fn test_beef() {
        let meal = Meal {
            main: "steak".to_owned(),
            side: Either::Right("Caesar".to_owned()),
        };
        assert_eq!(
            eat(meal),
            r#"Let's eat "steak" with a refreshing bowl of "Caesar" salad"#
        );
    }
}
