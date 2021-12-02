use std::{path::Path, str::FromStr};

use crate::utils;

#[derive(Debug)]
enum Instr {
    Up(u32),
    Down(u32),
    Forward(u32),
}

fn parse_instr(t: (&str, &str)) -> Instr {
    match t.0 {
        "up" => Instr::Up(t.1.parse().unwrap()),
        "down" => Instr::Down(t.1.parse().unwrap()),
        "forward" => Instr::Forward(t.1.parse().unwrap()),
        _ => panic!("unexpected instr: {}", t.0),
    }
}
pub fn solve_p2() -> Result<(), std::io::Error> {
    let vals = utils::load(&Path::new("../txt/day2.txt"))?;

    let instr = vals.iter().map(|x| parse_instr(x.split_once(" ").unwrap()));

    let mut aim = 0;
    let mut depth = 0;
    let mut hpos = 0;

    for instruction in instr {
        match instruction {
            Instr::Up(v) => aim -= v,
            Instr::Down(v) => aim += v,
            Instr::Forward(v) => {
                hpos += v;
                depth += aim * v
            }
        }
    }

    println!("{}", depth * hpos);
    // instr.into_iter().map(|instr| match instr {
    //     Instr::Up(v) =>
    //     Instr::Down(v) => todo!(),
    //     Instr::Forward(v) => todo!(),
    // })
    Ok(())
}
