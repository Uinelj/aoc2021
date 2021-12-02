use std::{fs::File, io::Read, path::Path};

pub fn load(path: &Path) -> Result<Vec<String>, std::io::Error> {
    let mut f = File::open(path)?;
    let mut s: String = String::new();
    f.read_to_string(&mut s)?;

    Ok(s.lines().map(String::from).collect())
}
