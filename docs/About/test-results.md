# How do test results work?

sUNC is known for its strict tests. Ever since it was made, it was built to expose falsified environments and spoofed globaly by testing for functionality - not just checking for their presence or shallow checking.

---

## Using the dedicated game

As of **sUNC V2**, all tests must be conducted in the official sUNC testing game. This game may be found on our [Discord server](https://discord.gg/FNNfTUpFYv).

We chose to do so, because by having a dedicated server, we're able to provide you with the new sUNC Rubis test results. This allows us to display the real results of the test, not just printed in the Roblox console.

---

## Viewing your test results

Once your test is complete, sUNC will generate a short redirect link via `r.sunc.su` like this:

![An `r.sunc.su` redirect link generated](./assets/test-results/melon.nu.png)

This generated link redirects to **Numelon Rubiš**:

![An sUNC Test Result being displayed with Numelon Rubiš](./assets/test-results/RubisTestResult.png)

The results page offers a clean, visually appealing UI that lays out which functions passed and which failed, why they failed, and cryptographic guarantees of authenticity.

---

## Verified integrity

Rubiš doesn't just store your sUNC test results, it also **verifies** them.

- Every result is **cryptographically signed** by the sUNC test game servers.
- Any tampered or faked data is **flagged as unverified**.

Even if someone tries to replicate the link or manually upload fake data and use it with the results viewer (since [Rubiš is also a public paste service](https://rubis.app) which is usable by anyone), it will not work.
